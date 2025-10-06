<template>
    <div class="grid">
        <div class="col-12">
            <div class="card">
                <Toast />
                <Toolbar class="mb-4">
                    <template v-slot:start>
                        <div class="my-2">
                            <Button label="New" icon="pi pi-plus" class="p-button-success mr-2" @click="openNew" />
                        </div>
                    </template>
                </Toolbar>

                <DataTable
                    ref="dt"
                    :value="demoShops"
                    v-model:selection="selectedDemoShops"
                    dataKey="id"
                    :paginator="true"
                    :rows="10"
                    :filters="filters"
                    paginatorTemplate="FirstPageLink PrevPageLink PageLinks NextPageLink LastPageLink CurrentPageReport RowsPerPageDropdown"
                    :rowsPerPageOptions="[5, 10, 25]"
                    currentPageReportTemplate="Showing {first} to {last} of {totalRecords} demo shops"
                    responsiveLayout="scroll"
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

                    <Column selectionMode="multiple" headerStyle="width: 3rem"></Column>
                    <Column field="name" header="Name" :sortable="true" headerStyle="width:20%; min-width:12rem;">
                        <template #body="slotProps">
                            <div class="text-wrap" style="word-wrap: break-word; white-space: normal; line-height: 1.4; padding: 0.75rem 0;">
                                {{ slotProps.data.name }}
                            </div>
                        </template>
                    </Column>
                    <Column field="link" header="Link" :sortable="true" headerStyle="width:30%; min-width:12rem;">
                        <template #body="slotProps">
                            <div style="padding: 0.75rem 0;">
                                <a :href="slotProps.data.link" target="_blank" class="text-blue-500 hover:text-blue-700" style="word-wrap: break-word; white-space: normal; line-height: 1.4;">{{ slotProps.data.link }}</a>
                            </div>
                        </template>
                    </Column>
                    <Column field="logo" header="Logo" headerStyle="width:15%; min-width:10rem;">
                        <template #body="slotProps">
                            <div style="padding: 0.75rem 0; text-align: center;">
                                <img v-if="slotProps.data.logo" :src="slotProps.data.logo" alt="Logo" class="w-6rem shadow-2 border-round" />
                                <span v-else class="text-gray-500">No logo</span>
                            </div>
                        </template>
                    </Column>
                    <Column field="description" header="Description" :sortable="true" headerStyle="width:25%; min-width:14rem;">
                        <template #body="slotProps">
                            <div class="text-sm" style="word-wrap: break-word; white-space: normal; line-height: 1.4; padding: 0.75rem 0; max-height: 4rem; overflow: hidden;">
                                {{ slotProps.data.description || 'No description' }}
                            </div>
                        </template>
                    </Column>
                    <Column headerStyle="min-width:10rem;">
                        <template #body="slotProps">
                            <Button icon="pi pi-pencil" class="p-button-rounded p-button-success mr-2" @click="editDemoShop(slotProps.data)" />
                            <Button icon="pi pi-trash" class="p-button-rounded p-button-warning mt-2" @click="confirmDeleteDemoShop(slotProps.data)" />
                        </template>
                    </Column>
                </DataTable>

                <Dialog v-model:visible="demoShopDialog" :style="{ width: '60vw', maxWidth: '800px' }" header="Demo Shop Details" :modal="true" class="p-fluid">
                    <div class="flex flex-col gap-6 px-4">
                        <FloatLabel variant="on" class="w-4/5">
                            <InputText id="name" v-model.trim="demoShop.name" required="true" autofocus :class="{ 'p-invalid': submitted && !demoShop.name }" size="large" class="w-full" />
                            <label for="name">Name</label>
                            <small class="p-error" v-if="submitted && !demoShop.name">Name is required.</small>
                        </FloatLabel>
                        
                        <FloatLabel variant="on" class="w-4/5">
                            <InputText id="link" v-model.trim="demoShop.link" required="true" :class="{ 'p-invalid': submitted && (!demoShop.link || !isValidUrl(demoShop.link)) }" size="large" class="w-full" />
                            <label for="link">Link (URL)</label>
                            <small class="p-error" v-if="submitted && !demoShop.link">Link is required.</small>
                            <small class="p-error" v-if="submitted && demoShop.link && !isValidUrl(demoShop.link)">Please enter a valid URL (e.g., https://example.com).</small>
                        </FloatLabel>
                        
                        <div class="w-4/5">
                            <label for="logo" class="block text-sm font-medium mb-2">Logo</label>
                            <FileUpload 
                                id="logo"
                                mode="basic" 
                                name="logo" 
                                :maxFileSize="5000000" 
                                accept="image/*" 
                                :auto="false"
                                chooseLabel="Choose Logo"
                                class="w-full"
                                @select="onLogoSelect"
                            />
                            <div v-if="demoShop.logo" class="mt-2">
                                <img :src="demoShop.logo" alt="Logo preview" class="max-w-32 max-h-32 object-contain border rounded" />
                            </div>
                        </div>
                        
                        <FloatLabel variant="on" class="w-4/5">
                            <Textarea id="description" v-model="demoShop.description" rows="4" cols="30" class="w-full" />
                            <label for="description">Description</label>
                        </FloatLabel>
                    </div>

                    <template #footer>
                        <Button label="Cancel" icon="pi pi-times" outlined @click="hideDialog" />
                        <Button label="Save" icon="pi pi-check" @click="saveDemoShop" />
                    </template>
                </Dialog>

                <Dialog v-model:visible="deleteDemoShopDialog" :style="{ width: '450px' }" header="Confirm Delete" :modal="true">
                    <div class="flex align-items-center justify-content-center p-4">
                        <i class="pi pi-exclamation-triangle mr-3 text-orange-500" style="font-size: 2rem" />
                        <span v-if="demoShop" class="text-lg">Are you sure you want to delete <b>{{ demoShop.name }}</b>?</span>
                    </div>
                    <template #footer>
                        <Button label="Cancel" icon="pi pi-times" outlined @click="deleteDemoShopDialog = false" />
                        <Button label="Delete" icon="pi pi-trash" severity="danger" @click="deleteDemoShop" />
                    </template>
                </Dialog>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { useToast } from 'primevue/usetoast';
import Toast from 'primevue/toast';
import Toolbar from 'primevue/toolbar';
import DataTable from 'primevue/datatable';
import Column from 'primevue/column';
import Dialog from 'primevue/dialog';
import Button from 'primevue/button';
import InputText from 'primevue/inputtext';
import Textarea from 'primevue/textarea';
import IconField from 'primevue/iconfield';
import InputIcon from 'primevue/inputicon';
import FloatLabel from 'primevue/floatlabel';
import FileUpload from 'primevue/fileupload';

// Import http utility with CSRF token support
import http from '../../../../../../resources/js/utils/http';

// CMS API functions for demo shops
const getBaseURL = () => {
    return window.location.origin;
};

const demoShopsAPI = {
    adminGetAll: async () => {
        try {
            const response = await http.get('/api/demo-shops/admin');
            return { success: true, data: response.data.data || [] };
        } catch (error) {
            console.error('Admin get demo shops error:', error);
            return { success: false, error: error.message };
        }
    },
    create: async (demoShopData) => {
        try {
            const response = await http.post('/api/demo-shops', demoShopData);
            return { success: true, data: response.data.data };
        } catch (error) {
            console.error('Create demo shop error:', error);
            if (error.response?.status === 419) {
                throw new Error('CSRF token mismatch.');
            }
            throw new Error(error.response?.data?.message || error.message);
        }
    },
    update: async (id, demoShopData) => {
        try {
            const response = await http.put(`/api/demo-shops/${id}`, demoShopData);
            return { success: true, data: response.data.data };
        } catch (error) {
            console.error('Update demo shop error:', error);
            if (error.response?.status === 419) {
                throw new Error('CSRF token mismatch.');
            }
            throw new Error(error.response?.data?.message || error.message);
        }
    },
    delete: async (id) => {
        try {
            const response = await http.delete(`/api/demo-shops/${id}`);
            return { success: true, data: response.data };
        } catch (error) {
            console.error('Delete demo shop error:', error);
            if (error.response?.status === 419) {
                throw new Error('CSRF token mismatch.');
            }
            throw new Error(error.response?.data?.message || error.message);
        }
    }
};

const toast = useToast();

const dt = ref(null);
const demoShops = ref(null);
const demoShopDialog = ref(false);
const deleteDemoShopDialog = ref(false);
const demoShop = ref({});
const selectedDemoShops = ref(null);
const filters = ref({
    global: { value: null, matchMode: 'contains' }
});
const submitted = ref(false);

onMounted(() => {
    loadDemoShops();
});

const loadDemoShops = async () => {
    try {
        const response = await demoShopsAPI.adminGetAll();
        if (response.success) {
            demoShops.value = response.data;
        } else {
            throw new Error(response.error || 'Failed to load demo shops');
        }
    } catch (error) {
        console.error('Error loading demo shops:', error);
        toast.add({ severity: 'error', summary: 'Error', detail: 'Failed to load demo shops', life: 3000 });
    }
};

const openNew = () => {
    demoShop.value = {};
    submitted.value = false;
    demoShopDialog.value = true;
};

const hideDialog = () => {
    demoShopDialog.value = false;
    submitted.value = false;
};

const saveDemoShop = async () => {
    submitted.value = true;
    if (demoShop.value.name && demoShop.value.name.trim() && demoShop.value.link && demoShop.value.link.trim() && isValidUrl(demoShop.value.link)) {
        try {
            let response;
            if (demoShop.value.id) {
                response = await demoShopsAPI.update(demoShop.value.id, demoShop.value);
                if (response.success) {
                    toast.add({ severity: 'success', summary: 'Successful', detail: 'Demo Shop Updated', life: 3000 });
                } else {
                    throw new Error(response.error || 'Failed to update demo shop');
                }
            } else {
                response = await demoShopsAPI.create(demoShop.value);
                if (response.success) {
                    toast.add({ severity: 'success', summary: 'Successful', detail: 'Demo Shop Created', life: 3000 });
                } else {
                    throw new Error(response.error || 'Failed to create demo shop');
                }
            }
            await loadDemoShops();
            demoShopDialog.value = false;
            demoShop.value = {};
        } catch (error) {
            console.error('Error saving demo shop:', error);
            toast.add({ severity: 'error', summary: 'Error', detail: error.message || 'Failed to save demo shop', life: 3000 });
        }
    }
};

const editDemoShop = (editDemoShop) => {
    demoShop.value = { ...editDemoShop };
    demoShopDialog.value = true;
};

const confirmDeleteDemoShop = (editDemoShop) => {
    demoShop.value = editDemoShop;
    deleteDemoShopDialog.value = true;
};

const deleteDemoShop = async () => {
    try {
        const response = await demoShopsAPI.delete(demoShop.value.id);
        if (response.success) {
            await loadDemoShops();
            deleteDemoShopDialog.value = false;
            demoShop.value = {};
            toast.add({ severity: 'success', summary: 'Successful', detail: 'Demo Shop Deleted', life: 3000 });
        } else {
            throw new Error(response.error || 'Failed to delete demo shop');
        }
    } catch (error) {
        console.error('Error deleting demo shop:', error);
        toast.add({ severity: 'error', summary: 'Error', detail: error.message || 'Failed to delete demo shop', life: 3000 });
    }
};

const clearFilter = () => {
    filters.value = {
        global: { value: null, matchMode: 'contains' }
    };
};

const onLogoSelect = (event) => {
    const file = event.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = (e) => {
            demoShop.value.logo = e.target.result;
        };
        reader.readAsDataURL(file);
    }
};

const isValidUrl = (string) => {
    try {
        const url = new URL(string);
        return url.protocol === 'http:' || url.protocol === 'https:';
    } catch (_) {
        return false;
    }
};


</script>

<style scoped lang="scss">
:deep(.p-datatable-frozen-tbody) {
    font-weight: bold;
}

:deep(.p-datatable-scrollable .p-frozen-column) {
    font-weight: bold;
}
</style>