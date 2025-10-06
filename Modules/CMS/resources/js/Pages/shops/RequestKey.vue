<template>
    <div>
        <div class="card">
            <Breadcrumb :items="[{ label: 'Shops' }, { label: 'Create' }]"/>
            <h2 class="text-xl font-bold">Add Shop</h2>

            <Form @submit="handleUpdate">
                <Fluid class="card flex-col md:flex-row gap-8">
                    <div v-for="field in formFields" :key="field.id">
                        <FloatLabel variant="on" class="mt-6">
                            <InputText
                                class="text-sm"
                                :name="field.id"
                                :id="field.id"
                                type="text"
                                v-model="form[field.id]"
                                size="large"
                            />
                            <label :for="field.id">{{ field.label }}</label>
                        </FloatLabel>
                    </div>

                    <div class="mt-6 flex justify-between">
                        <div class="relative w-5/6">
                            <FloatLabel variant="on">
                                <InputText
                                    v-model="shop.api_key"
                                    class="text-sm w-full pr-20"
                                    id="api_key"
                                    name="api_key"
                                    size="large"
                                    autocomplete="off"
                                    :class="{ 'text-transparent': !showKey, 'tracking-widest': !showKey }"
                                    :style="!showKey ? 'text-security: disc; -webkit-text-security: disc;' : ''"
                                    disabled
                                />
                                <label for="api_key">API Key</label>
                            </FloatLabel>

                            <button
                                type="button"
                                class="absolute top-1/2 right-10 transform -translate-y-1/2 text-gray-500 hover:text-black"
                                @click="toggleShowKey"
                            >
                                <i :class="showKey ? 'pi pi-eye-slash' : 'pi pi-eye'"></i>
                            </button>

                            <button
                                type="button"
                                class="absolute top-1/2 right-2 transform -translate-y-1/2 text-gray-500 hover:text-black"
                                @click="copyKey"
                            >
                                <i class="pi pi-copy"></i>
                            </button>
                        </div>
                        <div class="ml-2 d-flex justify-end w-1/3">
                            <Button
                                type="submit"
                                label="Request Change"
                                size="large"
                                iconPos="right"
                                class="w-1/6"
                                :loading="isLoading"
                                :disabled="isLoading"
                                @click="showConfirmation"
                                icon="pi pi-refresh"
                            />
                        </div>
                    </div>

                    <div class="mt-6">
                        <FloatLabel variant="on">
                            <InputText
                                class="text-sm"
                                name="domain"
                                id="domain"
                                type="text"
                                v-model="form.domain"
                                size="large"
                                :invalid="!!errors.domain"
                                @input="clearError('domain')"
                            />
                            <label for="domain">Domain</label>
                        </FloatLabel>
                        <small>example: https://abc.xyz or https://www.abc.xyz</small>
                        <small v-if="errors.domain" class="p-error">{{ errors.domain }}</small>
                    </div>

                    <div class="flex mt-6">
                        <div class="w-1/3">
                            <FloatLabel variant="on">
                                <Select
                                    id="province"
                                    v-model="form.province"
                                    :options="provinces"
                                    optionLabel="name"
                                    optionValue="name"
                                    size="large"
                                    showClear
                                    :invalid="!!errors.province"
                                    @change="handleProvinceChange"
                                />
                                <label for="province">City/Province</label>
                            </FloatLabel>
                        </div>
                        <div class="w-1/3 flex justify-end">
                            <FloatLabel variant="on" class="w-11/12">
                                <Select
                                    id="prefecture"
                                    v-model="form.prefecture"
                                    :options="districts"
                                    :disabled="!form.province"
                                    optionLabel="name"
                                    optionValue="name"
                                    size="large"
                                    showClear
                                    :invalid="!!errors.prefecture"
                                    @change="handleDistrictChange"
                                />
                                <label for="prefecture">Prefecture/District</label>
                            </FloatLabel>
                        </div>
                        <div class="w-1/3 flex justify-end">
                            <FloatLabel variant="on" class="w-11/12">
                                <Select
                                    id="town"
                                    v-model="form.town"
                                    :options="wards"
                                    :disabled="!form.prefecture"
                                    optionLabel="name"
                                    optionValue="name"
                                    size="large"
                                    showClear
                                    :invalid="!!errors.town"
                                    @change="clearError('town')"
                                />
                                <label for="town">Commune/Town</label>
                            </FloatLabel>
                        </div>
                    </div>

                    <div class="mt-6">
                        <FloatLabel variant="on">
                            <InputText
                                class="text-sm"
                                name="address"
                                id="address"
                                type="text"
                                v-model="form.address"
                                size="large"
                                :invalid="!!errors.address"
                                @input="clearError('address')"
                            />
                            <label for="address">Address</label>
                        </FloatLabel>
                    </div>

                    <div class="mt-6">
                        <FloatLabel variant="on">
                            <InputText
                                class="text-sm"
                                name="phone_number"
                                id="phone_number"
                                v-model="form.phone_number"
                                size="large"
                                :useGrouping="false"
                                :max="99999999999"
                                :invalid="!!errors.phone_number"
                                @input="clearError('phone_number')"
                            />
                            <label for="phone_number">Phone Number</label>
                        </FloatLabel>
                        <small v-if="errors.phone_number" class="p-error">{{ errors.phone_number }}</small>
                    </div>

                    <div class="mt-6">
                        <Checkbox
                            inputId="status"
                            name="status"
                            v-model="shop.status"
                            :binary="true"
                            :trueValue="1"
                            :falseValue="0"
                            disabled
                        />
                        <label for="status"> Active/Inactive </label>
                    </div>
                    <div class="mt-6">
                        <div style="width: 150px">
                            <Button as="a" label="Buy more credit" href="/cms/pricing/index" rel="noopener" />
                        </div>
                    </div>

                    <div class="flex justify-center mt-6">
                        <Button
                            type="submit"
                            class="ml-3"
                            icon="pi pi-check"
                            text
                            raised
                            rounded
                        />
                    </div>
                </Fluid>
            </Form>
        </div>

        <!-- Global Fullscreen Loading -->
        <div
            v-if="isLoading"
            class="fixed inset-0 bg-black bg-opacity-50 z-[9999] flex items-center justify-center"
        >
            <i class="pi pi-spinner-dotted pi-spin text-white" style="font-size: 3rem;"></i>
        </div>

        <ConfirmDialog
            v-model:visible="displayConfirmation"
            message="Are you sure you want to request change API Key?"
            @confirm="handleRequest"
        />
    </div>
</template>

<script setup>
import FloatLabel from 'primevue/floatlabel';
import InputText from 'primevue/inputtext';
import Fluid from 'primevue/fluid';
import Checkbox from 'primevue/checkbox';
import Button from 'primevue/button';
import {useForm, usePage} from '@inertiajs/vue3';
import Breadcrumb from '../../component/Breadcrumb.vue';
import {onMounted, ref, watch} from 'vue';
import {useToast} from 'primevue/usetoast';
import ConfirmDialog from '../../component/ConfirmDialog.vue';
import Select from "primevue/select";
import { Form } from '@primevue/forms';
import Tag from 'primevue/tag';


const toast = useToast();
const {props} = usePage();
const shop = props.shop;
const formFields = [{id: 'name', label: 'Shop Name'}];
const showKey = ref(false);
const isLoading = ref(false);
const displayConfirmation = ref(false);
const provinces = ref([]);
const districts = ref([]);
const wards = ref([]);
const form = useForm({
    name: props.shop.name || '',
    api_key: props.shop.api_key || '',
    province: props.shop.province || '',
    prefecture: props.shop.prefecture || '',
    town: props.shop.town || '',
    address: props.shop.address || '',
    phone_number: props.shop.phone_number || null,
    status: props.shop.status || 0,
    request_key_flag: 0,
    domain: props.shop.domain || '',
    _method: 'PUT'
});

const toggleShowKey = () => {
    showKey.value = !showKey.value;
};

onMounted(async () => {
    try {
        const response = await fetch('https://provinces.open-api.vn/api/p/');
        provinces.value = await response.json();

        if (form.province) {
            const selectedProvince = provinces.value.find(p => p.name === form.province);

            if (selectedProvince) {
                await loadOptionDistrict(selectedProvince)

                if (form.prefecture) {
                    const selectedDistrict = districts.value.find(d => d.name === form.prefecture);

                    if (selectedDistrict) {
                        await loadOptionTown(selectedDistrict)
                    }
                }
            }

        }
    } catch (error) {
        toast.add({severity: 'error', summary: 'Error', detail: 'Failed to load provinces', life: 3000});
    }
});

const copyKey = async () => {
    try {
        await navigator.clipboard.writeText(shop.api_key);
        toast.add({severity: 'success', summary: 'Success', detail: 'Copy API Key Success!', life: 3000});
    } catch (e) {
        toast.add({severity: 'error', summary: 'Error', detail: 'Copy API Key Error!', life: 3000});
    }
};

const clearError = (field) => {
    if (errors.value[field]) {
        errors.value[field] = '';
        errors.value = {...errors.value};
    }
};

const loadOptionDistrict = async (selectedProvince) => {
    try {
        const response = await fetch(`https://provinces.open-api.vn/api/p/${selectedProvince.code}?depth=2`);
        const data = await response.json();
        districts.value = data.districts;
    } catch (error) {
        toast.add({severity: 'error', summary: 'Error', detail: 'Failed to load districts', life: 3000});
    }
}

const loadOptionTown = async (selectedDistrict) => {
    try {
        const response = await fetch(`https://provinces.open-api.vn/api/d/${selectedDistrict.code}?depth=2`);
        const data = await response.json();
        wards.value = data.wards;
    } catch (error) {
        toast.add({severity: 'error', summary: 'Error', detail: 'Failed to load wards', life: 3000});
    }
}

const handleProvinceChange = async (event, defaultValue = null) => {
    form.prefecture = '';
    form.town = '';
    districts.value = [];
    wards.value = [];
    clearError('province');
    clearError('prefecture');
    clearError('town');

    const selectedProvince = provinces.value.find(p => p.name === (defaultValue ?? event.value));
    if (selectedProvince) {
        await loadOptionDistrict(selectedProvince)
    }
};

const handleDistrictChange = async (event, defaultValue = null) => {
    form.town = '';
    wards.value = [];
    clearError('prefecture');
    clearError('town');

    const selectedDistrict = districts.value.find(d => d.name === (defaultValue ?? event.value));
    if (selectedDistrict) {
        await loadOptionTown(selectedDistrict)
    }
};

const showConfirmation = () => {
    displayConfirmation.value = true;
};

const handleRequest = () => {
    isLoading.value = true;

    form.transform((form) => {
        const formData = new FormData();
        formData.append('_method', 'PUT');
        formData.append('status', form.status);
        return formData;
    }).post(`/cms/shops/status`, {
        preserveState: true,
        preserveScroll: true,
        forceFormData: true,
        onSuccess: () => {
            toast.add({
                severity: 'success',
                summary: 'Success',
                detail: 'Request Change Key Success!',
                life: 3000
            });
        },
        onError: (errors) => {
            console.error('Request Change Key Failed:', errors);
        },
        onFinish: () => {
            isLoading.value = false;
        },
    });
};

const isValidDomain = (domain) => {
    const regex = /^https:\/\/(?!:\/\/)([a-zA-Z0-9-_]+\.)+[a-zA-Z]{2,}$/;

    return regex.test(domain);
}

const errors = ref({});
const validateForm = () => {
    errors.value = {};

    const requiredFields = [
        {id: 'name', label: 'Shop Name'},
        {id: 'phone_number', label: 'Phone Number'},
        {id: 'domain', label: 'Domain'},
    ];

    requiredFields.forEach(field => {
        if (!form[field.id]) {
            errors.value[field.id] = `${field.label} is required`;
        }
    });

    if (form.domain) {
        if (!isValidDomain(form.domain)) {
            errors.value.domain = 'Invalid domain format'
        }
    }

    if (form.phone_number !== null) {
        const phoneRegex = /^\d{10,11}$/;
        if (!phoneRegex.test(form.phone_number)) {
            errors.value.phone_number = 'Phone number must be 10 or 11 digits';
        }
    }

    errors.value = {...errors.value};
    return Object.keys(errors.value).length === 0;
};

const handleUpdate = () => {
    const isValid = validateForm();
    if (!isValid) {
        const errorMessages = Object.values(errors.value).filter(msg => msg).join(', ');
        toast.add({
            severity: 'error',
            summary: 'Error',
            detail: errorMessages || 'Please fill in all required fields correctly',
            life: 3000
        });
        return;
    }

    form.post(`/cms/shops/${props.shop.id}`, {
        preserveState: true,
        preserveScroll: true,
        forceFormData: true,
        onSuccess: () => {
            toast.add({
                severity: 'success',
                summary: 'Success',
                detail: 'Update Shop Success!',
                life: 3000
            });
            errors.value = {};
        },
        onError: (backendErrors) => {
            errors.value = {...backendErrors};
            toast.add({
                severity: 'error',
                summary: 'Error',
                detail: 'Failed to update shop',
                life: 3000
            });
        }
    });
};
</script>

<style scoped>
.p-error {
    color: #ef4444 !important;
    font-size: 0.875rem;
    margin-top: 0.25rem;
    display: block;
}
</style>
