<template>
    <div class="card">
        <Breadcrumb :items="[{ label: 'Subscriber' }, { label: 'Subscriber Histories' },]"/>
        <div class="flex justify-between mt-4">
            <h2 class="text-xl font-bold mb-4">Subscriber Histories</h2>
        </div>
        <DataTable
            :value="subscriberHistories"
            :paginator="true"
            :rows="10"
            dataKey="id"
            :rowHover="true"
            v-model:filters="filters"
            filterDisplay="menu"
            :loading="loading"
            :globalFilterFields="['shop_name', 'product_name']"
            showGridlines
        >
            <template #header>
                <div class="flex justify-between">
                    <Button type="button" icon="pi pi-filter-slash" label="Clear" outlined @click="clearFilter"/>
                    <IconField>
                        <InputIcon>
                            <i class="pi pi-search"/>
                        </InputIcon>
                        <InputText v-model="filters['global'].value" placeholder="Keyword Search"/>
                    </IconField>
                </div>
            </template>

            <Column field="shop_name" header="Shop" style="max-width: 5rem">
            </Column>

            <Column field="name" header="Product" style="max-width: 5rem">
                <template #body="{ data }">
                    <div class="flex items-center">
                        <a class="no-underline hover:underline" :href="'/cms/products/' + data.product_id + '/edit'">
                            {{ data.product_name }}
                        </a>
                    </div>
                </template>
            </Column>

            <Column field="price" header="Price ($)" style="max-width: 5rem">
                <template #body="{ data }">
                    <span>{{ data.price || '-' }}</span>
                </template>
            </Column>

            <Column field="status" header="Type" style="max-width: 5rem">
                <template #body="{ data }">
                    <span>{{ data.type }}</span>
                </template>
            </Column>

            <Column field="payment_session_id" header="Payment Session ID" style="max-width: 7rem">
                <template #body="{ data }">
                    <span>{{ data.payment_session_id }}</span>
                </template>
            </Column>

            <Column field="release_date" header="Buy At" style="max-width: 5rem">
                <template #body="{ data }">
                    <span>{{ data.buy_at || '-' }}</span>
                </template>
            </Column>

            <Column field="payment_status" header="Payment Status" style="max-width: 12rem">
                <template #body="{ data }">
                    <div class="flex gap-2">
                        <span :class="{
                            'bg-yellow-100 text-yellow-700 px-2 py-1 rounded': data.payment_status === 'Pending',
                            'bg-green-100 text-green-700 px-2 py-1 rounded': data.payment_status === 'Success',
                            'bg-red-100 text-red-700 px-2 py-1 rounded': data.payment_status === 'Failed'
                        }">
                        {{ data.payment_status || '-' }}
                        </span>
                        <Button v-if="data.payment_status === 'Pending' || data.payment_status === 'Failed'" 
                            icon="pi pi-check" 
                            severity="success"
                            @click="updatePaymentStatus(data.id, 1)"
                            text
                            size="small"
                        />
                        <Button v-if="data.payment_status === 'Pending' || data.payment_status === 'Failed'"
                            icon="pi pi-times"
                            severity="danger" 
                            @click="updatePaymentStatus(data.id, 2)"
                            text
                            size="small"
                        />

                        <Button v-if="data.payment_status === 'Success'"
                            icon="pi pi-clock" 
                            severity="warning"
                            @click="updatePaymentStatus(data.id, 3)"
                            text
                            size="small"
                            class="text-yellow-500"
                        />
                    </div>
                </template>
            </Column>
        </DataTable>
    </div>
</template>

<script setup>
import {ref} from 'vue';
import DataTable from 'primevue/datatable';
import Column from 'primevue/column';
import InputText from 'primevue/inputtext';
import IconField from 'primevue/iconfield';
import InputIcon from 'primevue/inputicon';
import Button from 'primevue/button';
import {FilterMatchMode, FilterOperator} from '@primevue/core/api';
import {Link, usePage} from '@inertiajs/vue3';
import Breadcrumb from "../../component/Breadcrumb.vue";
import http from '/resources/js/utils/http.js';
import {useToast} from 'primevue/usetoast';


const {props} = usePage();
const subscriberHistories = ref(props.subscriberHistories?.data ?? []);
const filters = ref(null);
const loading = ref(false);
const toast = useToast();

function initFilters() {
    filters.value = {
        global: {value: null},
        subscribe_id: {value: null, matchMode: FilterMatchMode.STARTS_WITH},
        price: {operator: FilterOperator.AND, constraints: [{value: null, matchMode: FilterMatchMode.EQUALS}]},
        buy_at: {value: null, matchMode: FilterMatchMode.DATE_IS},
    };
}

function clearFilter() {
    initFilters();
}

// Hàm cập nhật trạng thái thanh toán
async function updatePaymentStatus(subscriberHistoryId, paymentStatus) {
    try {
        loading.value = true;
        
        // Tìm subscriber history để lấy payment_session_id
        const subscriberHistory = subscriberHistories.value.find(item => item.id === subscriberHistoryId);
        if (!subscriberHistory) {
            throw new Error('Subscriber history not found');
        }
        
        // Gọi API updateOrderRecord
        const response = await http.post('/api/v1/payment/update-order', {
            orderId: subscriberHistory.payment_session_id,
            paymentStatus: paymentStatus
        });
        
        if (response.data.success) {
            // Cập nhật trạng thái trong danh sách local
            const index = subscriberHistories.value.findIndex(item => item.id === subscriberHistoryId);
            if (index !== -1) {
                // Chuyển đổi số thành chuỗi tương ứng
                const statusMap = {
                    1: 'Success',
                    2: 'Failed',
                    3: 'Pending'
                };
                subscriberHistories.value[index].payment_status = statusMap[paymentStatus] || 'Unknown';
            }
            
            // Hiển thị thông báo thành công
            toast.add({
                severity: 'success',
                summary: 'Success',
                detail: 'Payment status updated successfully',
                life: 3000
            });
        } else {
            throw new Error(response.data.message || 'Failed to update payment status');
        }
    } catch (error) {
        console.error('Error updating payment status:', error);
        // Hiển thị thông báo lỗi
        toast.add({
            severity: 'error',
            summary: 'Error',
            detail: 'Failed to update payment status: ' + error.message,
            life: 3000
        });
    } finally {
        loading.value = false;
    }
}

initFilters();
</script>
