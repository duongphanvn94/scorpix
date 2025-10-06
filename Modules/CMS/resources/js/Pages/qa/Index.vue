<template>
    <div class="card">
        <div class="flex justify-between items-center mb-6">
            <div>
                <h1 class="text-2xl font-bold text-gray-900">Q&A Management</h1>
                <p class="text-gray-600 mt-1">Manage questions and answers</p>
            </div>
            <Button @click="openCreateDialog" icon="pi pi-plus" label="Add Q&A" class="p-button-primary" />
        </div>

        <!-- Filters -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
            <div class="flex flex-col">
                <label class="text-sm font-medium text-gray-700 mb-2">Search</label>
                <InputText v-model="filters.search" placeholder="Search questions or answers..." @input="loadQAs" />
            </div>
            <div class="flex flex-col">
                <label class="text-sm font-medium text-gray-700 mb-2">Status</label>
                <Dropdown v-model="filters.status" :options="statusOptions" optionLabel="label" optionValue="value" 
                    placeholder="All Status" @change="loadQAs" showClear />
            </div>
            <div class="flex items-end">
                <Button @click="clearFilters" icon="pi pi-filter-slash" label="Clear Filters" class="p-button-outlined" />
            </div>
        </div>

        <!-- Q&A Table -->
        <DataTable :value="qas.data" :loading="loading" stripedRows responsiveLayout="scroll" 
            :paginator="true" :rows="qas.per_page" :totalRecords="qas.total" 
            paginatorTemplate="FirstPageLink PrevPageLink PageLinks NextPageLink LastPageLink CurrentPageReport RowsPerPageDropdown"
            currentPageReportTemplate="Showing {first} to {last} of {totalRecords} entries"
            @page="onPageChange">
            
            <Column field="id" header="ID" :sortable="true" style="width: 80px">
                <template #body="slotProps">
                    <span class="font-medium">#{{ slotProps.data.id }}</span>
                </template>
            </Column>
            
            <Column field="question" header="Question" :sortable="true">
                <template #body="slotProps">
                    <div class="max-w-md">
                        <p class="text-sm text-gray-900 line-clamp-2">{{ slotProps.data.question }}</p>
                    </div>
                </template>
            </Column>
            
            <Column field="answer" header="Answer" :sortable="true">
                <template #body="slotProps">
                    <div class="max-w-md">
                        <p class="text-sm text-gray-600 line-clamp-2">{{ slotProps.data.answer }}</p>
                    </div>
                </template>
            </Column>
            
            <Column field="status" header="Status" :sortable="true" style="width: 120px">
                <template #body="slotProps">
                    <Tag :value="slotProps.data.status ? 'Active' : 'Inactive'" 
                        :severity="slotProps.data.status ? 'success' : 'danger'" />
                </template>
            </Column>
            
            <Column field="created_at" header="Created" :sortable="true" style="width: 150px">
                <template #body="slotProps">
                    <span class="text-sm text-gray-600">{{ formatDate(slotProps.data.created_at) }}</span>
                </template>
            </Column>
            
            <Column header="Actions" style="width: 200px">
                <template #body="slotProps">
                    <div class="flex gap-2">
                        <Button @click="viewQA(slotProps.data)" icon="pi pi-eye" 
                            class="p-button-rounded p-button-text p-button-info" 
                            v-tooltip.top="'View'" />
                        <Button @click="editQA(slotProps.data)" icon="pi pi-pencil" 
                            class="p-button-rounded p-button-text p-button-warning" 
                            v-tooltip.top="'Edit'" />
                        <Button @click="toggleStatus(slotProps.data)" 
                            :icon="slotProps.data.status ? 'pi pi-eye-slash' : 'pi pi-eye'" 
                            :class="slotProps.data.status ? 'p-button-rounded p-button-text p-button-secondary' : 'p-button-rounded p-button-text p-button-success'" 
                            :v-tooltip.top="slotProps.data.status ? 'Deactivate' : 'Activate'" />
                        <Button @click="deleteQA(slotProps.data)" icon="pi pi-trash" 
                            class="p-button-rounded p-button-text p-button-danger" 
                            v-tooltip.top="'Delete'" />
                    </div>
                </template>
            </Column>
        </DataTable>
    </div>

    <!-- Create/Edit Dialog -->
    <Dialog v-model:visible="showDialog" :header="isEditing ? 'Edit Q&A' : 'Create Q&A'" 
        :style="{width: '600px'}" :modal="true" class="p-fluid qa-dialog">
        <template #header>
            <div class="flex items-center gap-3">
                <div class="w-10 h-10 bg-blue-100 rounded-lg flex items-center justify-center">
                    <i class="pi pi-question-circle text-blue-600 text-xl"></i>
                </div>
                <div>
                    <h3 class="text-xl font-semibold text-gray-900 m-0">{{ isEditing ? 'Edit Q&A' : 'Create New Q&A' }}</h3>
                    <p class="text-sm text-gray-600 m-0 mt-1">{{ isEditing ? 'Update question and answer details' : 'Add a new question and answer to help users' }}</p>
                </div>
            </div>
        </template>
        
        <form @submit.prevent="submitForm" class="space-y-6">
            <!-- Question Field -->
            <div class="form-group">
                <label for="question" class="block text-sm font-semibold text-gray-700 mb-2">
                    <i class="pi pi-question text-blue-500 mr-2"></i>
                    Question *
                </label>
                <Textarea id="question" v-model="form.question" rows="3" 
                    placeholder="Enter a clear and concise question..." required 
                    :class="{'p-invalid': errors.question}" 
                    class="w-full border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-all duration-200" />
                <small v-if="errors.question" class="p-error flex items-center mt-1">
                    <i class="pi pi-exclamation-circle mr-1"></i>
                    {{ errors.question[0] }}
                </small>
                <small class="text-gray-500 text-xs mt-1 block">Keep it clear and specific for better user understanding</small>
            </div>
            
            <!-- Answer Field -->
            <div class="form-group">
                <label for="answer" class="block text-sm font-semibold text-gray-700 mb-2">
                    <i class="pi pi-comment text-green-500 mr-2"></i>
                    Answer *
                </label>
                <Textarea id="answer" v-model="form.answer" rows="6" 
                    placeholder="Provide a detailed and helpful answer..." required 
                    :class="{'p-invalid': errors.answer}" 
                    class="w-full border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-all duration-200" />
                <small v-if="errors.answer" class="p-error flex items-center mt-1">
                    <i class="pi pi-exclamation-circle mr-1"></i>
                    {{ errors.answer[0] }}
                </small>
                <small class="text-gray-500 text-xs mt-1 block">You can use line breaks for better formatting</small>
            </div>
            
            <!-- Status Field -->
            <div class="form-group">
                <div class="bg-gray-50 rounded-lg p-4 border border-gray-200">
                    <div class="flex items-center justify-between">
                        <div class="flex items-center">
                            <i class="pi pi-eye text-purple-500 mr-2"></i>
                            <div>
                                <label for="status" class="text-sm font-semibold text-gray-700">Visibility Status</label>
                                <p class="text-xs text-gray-600 mt-1">Control whether this Q&A is visible to users</p>
                            </div>
                        </div>
                        <div class="flex items-center gap-3">
                            <Checkbox id="status" v-model="form.status" :binary="true" 
                                class="transform scale-125" />
                            <label for="status" class="text-sm font-medium" 
                                :class="form.status ? 'text-green-600' : 'text-gray-500'">
                                {{ form.status ? 'Active' : 'Inactive' }}
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        
        <template #footer>
            <div class="flex justify-end gap-3 pt-4 border-t border-gray-200">
                <Button @click="closeDialog" label="Cancel" 
                    class="px-6 py-2 border border-gray-300 text-gray-700 hover:bg-gray-50 rounded-lg transition-all duration-200" 
                    type="button" />
                <Button :loading="submitting" @click="submitForm" 
                    :label="isEditing ? 'Update Q&A' : 'Create Q&A'" 
                    class="px-6 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded-lg transition-all duration-200 flex items-center gap-2" 
                    type="button">
                    <i :class="isEditing ? 'pi pi-check' : 'pi pi-plus'" class="text-sm"></i>
                </Button>
            </div>
        </template>
    </Dialog>

    <!-- View Dialog -->
    <Dialog v-model:visible="showViewDialog" header="Q&A Details" 
        :style="{width: '50vw'}" :modal="true">
        <div v-if="selectedQA">
            <div class="mb-4">
                <h3 class="font-medium text-lg mb-2">Question:</h3>
                <p class="text-gray-700">{{ selectedQA.question }}</p>
            </div>
            
            <div class="mb-4">
                <h3 class="font-medium text-lg mb-2">Answer:</h3>
                <p class="text-gray-700 whitespace-pre-wrap">{{ selectedQA.answer }}</p>
            </div>
            
            <div class="grid grid-cols-2 gap-4 text-sm text-gray-600">
                <div>
                    <strong>Status:</strong> 
                    <Tag :value="selectedQA.status ? 'Active' : 'Inactive'" 
                        :severity="selectedQA.status ? 'success' : 'danger'" class="ml-2" />
                </div>
                <div><strong>Created:</strong> {{ formatDate(selectedQA.created_at) }}</div>
                <div><strong>Updated:</strong> {{ formatDate(selectedQA.updated_at) }}</div>
            </div>
        </div>
        
        <template #footer>
            <Button @click="showViewDialog = false" label="Close" class="p-button-text" />
        </template>
    </Dialog>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'
import { useToast } from 'primevue/usetoast'
import { useConfirm } from 'primevue/useconfirm'
import DataTable from 'primevue/datatable'
import Column from 'primevue/column'
import Button from 'primevue/button'
import Dialog from 'primevue/dialog'
import InputText from 'primevue/inputtext'
import Textarea from 'primevue/textarea'
import Dropdown from 'primevue/dropdown'
import Checkbox from 'primevue/checkbox'
import Tag from 'primevue/tag'
import { router } from '@inertiajs/vue3'

const toast = useToast()
const confirm = useConfirm()

// Data
const qas = ref({ data: [], total: 0, per_page: 10 })
const loading = ref(false)
const showDialog = ref(false)
const showViewDialog = ref(false)
const isEditing = ref(false)
const submitting = ref(false)
const selectedQA = ref(null)
const errors = ref({})

// Filters
const filters = reactive({
    search: '',
    status: null
})

const statusOptions = [
    { label: 'Active', value: true },
    { label: 'Inactive', value: false }
]

// Form
const form = reactive({
    id: null,
    question: '',
    answer: '',
    status: true
})

// Methods
const loadQAs = async (page = 1) => {
    loading.value = true
    try {
        const params = new URLSearchParams({
            page: page,
            ...filters
        })
        
        const response = await fetch(`/cms/qa/index?${params}`)
        const data = await response.json()
        
        if (data.props && data.props.qas) {
            qas.value = data.props.qas
        }
    } catch (error) {
        toast.add({
            severity: 'error',
            summary: 'Error',
            detail: 'Failed to load Q&As',
            life: 3000
        })
    } finally {
        loading.value = false
    }
}

const openCreateDialog = () => {
    resetForm()
    isEditing.value = false
    showDialog.value = true
}

const editQA = (qa) => {
    form.id = qa.id
    form.question = qa.question
    form.answer = qa.answer
    form.status = qa.status
    isEditing.value = true
    showDialog.value = true
}

const viewQA = (qa) => {
    selectedQA.value = qa
    showViewDialog.value = true
}

const submitForm = async () => {
    submitting.value = true
    errors.value = {}
    
    try {
        const url = isEditing.value ? `/cms/qa/${form.id}` : '/cms/qa/store'
        const method = isEditing.value ? 'PUT' : 'POST'
        
        await router.visit(url, {
            method: method,
            data: {
                question: form.question,
                answer: form.answer,
                status: form.status
            },
            onSuccess: () => {
                closeDialog()
                loadQAs()
                toast.add({
                    severity: 'success',
                    summary: 'Success',
                    detail: `Q&A ${isEditing.value ? 'updated' : 'created'} successfully`,
                    life: 3000
                })
            },
            onError: (errors) => {
                errors.value = errors
            }
        })
    } catch (error) {
        toast.add({
            severity: 'error',
            summary: 'Error',
            detail: 'Failed to save Q&A',
            life: 3000
        })
    } finally {
        submitting.value = false
    }
}

const toggleStatus = async (qa) => {
    try {
        await router.visit(`/cms/qa/${qa.id}/toggle-status`, {
            method: 'PUT',
            onSuccess: () => {
                loadQAs()
                toast.add({
                    severity: 'success',
                    summary: 'Success',
                    detail: `Q&A ${qa.status ? 'deactivated' : 'activated'} successfully`,
                    life: 3000
                })
            }
        })
    } catch (error) {
        toast.add({
            severity: 'error',
            summary: 'Error',
            detail: 'Failed to update status',
            life: 3000
        })
    }
}

const deleteQA = (qa) => {
    confirm.require({
        message: 'Are you sure you want to delete this Q&A?',
        header: 'Confirm Delete',
        icon: 'pi pi-exclamation-triangle',
        accept: async () => {
            try {
                await router.visit(`/cms/qa/${qa.id}`, {
                    method: 'DELETE',
                    onSuccess: () => {
                        loadQAs()
                        toast.add({
                            severity: 'success',
                            summary: 'Success',
                            detail: 'Q&A deleted successfully',
                            life: 3000
                        })
                    }
                })
            } catch (error) {
                toast.add({
                    severity: 'error',
                    summary: 'Error',
                    detail: 'Failed to delete Q&A',
                    life: 3000
                })
            }
        }
    })
}

const closeDialog = () => {
    showDialog.value = false
    resetForm()
    errors.value = {}
}

const resetForm = () => {
    form.id = null
    form.question = ''
    form.answer = ''
    form.status = true
}

const clearFilters = () => {
    filters.search = ''
    filters.status = null
    loadQAs()
}

const onPageChange = (event) => {
    loadQAs(event.page + 1)
}

const formatDate = (dateString) => {
    return new Date(dateString).toLocaleDateString('vi-VN', {
        year: 'numeric',
        month: '2-digit',
        day: '2-digit',
        hour: '2-digit',
        minute: '2-digit'
    })
}

// Lifecycle
onMounted(() => {
    loadQAs()
})
</script>

<style scoped>
.line-clamp-2 {
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
}

.qa-table {
    background: white;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.status-badge {
    padding: 4px 12px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: 500;
}

.status-active {
    background-color: #dcfce7;
    color: #166534;
}

.status-inactive {
    background-color: #fef2f2;
    color: #dc2626;
}

.action-buttons {
    display: flex;
    gap: 8px;
}

/* QA Dialog Styles */
:deep(.qa-dialog) {
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
}

:deep(.qa-dialog .p-dialog-header) {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    padding: 1.5rem;
    border-bottom: none;
}

:deep(.qa-dialog .p-dialog-content) {
    padding: 2rem;
    background: #fafafa;
}

:deep(.qa-dialog .p-dialog-footer) {
    background: white;
    padding: 1.5rem 2rem;
    border-top: 1px solid #e5e7eb;
}

.form-group {
    margin-bottom: 1.5rem;
}

.form-group:last-child {
    margin-bottom: 0;
}

:deep(.form-group .p-inputtextarea) {
    border: 2px solid #e5e7eb;
    border-radius: 8px;
    padding: 12px 16px;
    font-size: 14px;
    transition: all 0.3s ease;
    background: white;
}

:deep(.form-group .p-inputtextarea:focus) {
    border-color: #3b82f6;
    box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
    outline: none;
}

:deep(.form-group .p-inputtextarea.p-invalid) {
    border-color: #ef4444;
    box-shadow: 0 0 0 3px rgba(239, 68, 68, 0.1);
}

:deep(.p-checkbox .p-checkbox-box) {
    border: 2px solid #d1d5db;
    border-radius: 6px;
    width: 20px;
    height: 20px;
    transition: all 0.3s ease;
}

:deep(.p-checkbox .p-checkbox-box.p-highlight) {
    background: #3b82f6;
    border-color: #3b82f6;
}

:deep(.p-checkbox .p-checkbox-box:hover) {
    border-color: #3b82f6;
}

.space-y-6 > * + * {
    margin-top: 1.5rem;
}

/* Button Animations */
:deep(.p-button) {
    transition: all 0.3s ease;
    font-weight: 500;
}

:deep(.p-button:hover) {
    transform: translateY(-1px);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

:deep(.p-button:active) {
    transform: translateY(0);
}

/* Loading Animation */
:deep(.p-button .p-button-loading-icon) {
    animation: spin 1s linear infinite;
}

@keyframes spin {
    from { transform: rotate(0deg); }
    to { transform: rotate(360deg); }
}

/* Error Message Styling */
.p-error {
    color: #ef4444;
    font-size: 12px;
    font-weight: 500;
}

/* Helper Text Styling */
small.text-gray-500 {
    color: #6b7280;
    font-style: italic;
}

/* Status Section Styling */
.bg-gray-50 {
    background-color: #f9fafb;
    transition: all 0.3s ease;
}

.bg-gray-50:hover {
    background-color: #f3f4f6;
}
</style>