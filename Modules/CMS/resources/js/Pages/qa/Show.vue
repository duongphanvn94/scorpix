<template>
    <div class="card">
        <div class="mb-6">
            <div class="flex items-center justify-between">
                <div class="flex items-center gap-2">
                    <Button @click="goBack" icon="pi pi-arrow-left" class="p-button-text p-button-plain" />
                    <h1 class="text-2xl font-bold text-gray-900">Q&A Details</h1>
                </div>
                <div class="flex gap-2">
                    <Button @click="editQA" icon="pi pi-pencil" label="Edit" class="p-button-outlined" />
                    <Button @click="toggleStatus" 
                        :icon="qa.status ? 'pi pi-eye-slash' : 'pi pi-eye'" 
                        :label="qa.status ? 'Deactivate' : 'Activate'" 
                        :class="qa.status ? 'p-button-outlined p-button-secondary' : 'p-button-outlined p-button-success'" />
                    <Button @click="deleteQA" icon="pi pi-trash" label="Delete" class="p-button-outlined p-button-danger" />
                </div>
            </div>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
            <!-- Main Content -->
            <div class="lg:col-span-2">
                <div class="bg-white border rounded-lg p-6 mb-6">
                    <h2 class="text-lg font-semibold text-gray-900 mb-4">Question</h2>
                    <p class="text-gray-700 leading-relaxed">{{ qa.question }}</p>
                </div>
                
                <div class="bg-white border rounded-lg p-6">
                    <h2 class="text-lg font-semibold text-gray-900 mb-4">Answer</h2>
                    <div class="text-gray-700 leading-relaxed whitespace-pre-wrap">{{ qa.answer }}</div>
                </div>
            </div>
            
            <!-- Sidebar -->
            <div class="lg:col-span-1">
                <div class="bg-white border rounded-lg p-6">
                    <h3 class="text-lg font-semibold text-gray-900 mb-4">Information</h3>
                    
                    <div class="space-y-4">
                        <div>
                            <label class="text-sm font-medium text-gray-500">ID</label>
                            <p class="text-gray-900">#{{ qa.id }}</p>
                        </div>
                        
                        <div>
                            <label class="text-sm font-medium text-gray-500">Status</label>
                            <div class="mt-1">
                                <Tag :value="qa.status ? 'Active' : 'Inactive'" 
                                    :severity="qa.status ? 'success' : 'danger'" />
                            </div>
                        </div>
                        
                        <div>
                            <label class="text-sm font-medium text-gray-500">Created At</label>
                            <p class="text-gray-900">{{ formatDate(qa.created_at) }}</p>
                        </div>
                        
                        <div>
                            <label class="text-sm font-medium text-gray-500">Updated At</label>
                            <p class="text-gray-900">{{ formatDate(qa.updated_at) }}</p>
                        </div>
                    </div>
                </div>
                
                <!-- Quick Actions -->
                <div class="bg-white border rounded-lg p-6 mt-6">
                    <h3 class="text-lg font-semibold text-gray-900 mb-4">Quick Actions</h3>
                    
                    <div class="space-y-3">
                        <Button @click="editQA" icon="pi pi-pencil" label="Edit Q&A" 
                            class="w-full p-button-outlined" />
                        <Button @click="duplicateQA" icon="pi pi-copy" label="Duplicate" 
                            class="w-full p-button-outlined" />
                        <Button @click="toggleStatus" 
                            :icon="qa.status ? 'pi pi-eye-slash' : 'pi pi-eye'" 
                            :label="qa.status ? 'Deactivate' : 'Activate'" 
                            :class="qa.status ? 'w-full p-button-outlined p-button-secondary' : 'w-full p-button-outlined p-button-success'" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref } from 'vue'
import { router } from '@inertiajs/vue3'
import { useToast } from 'primevue/usetoast'
import { useConfirm } from 'primevue/useconfirm'
import Button from 'primevue/button'
import Tag from 'primevue/tag'

// Props
const props = defineProps({
    qa: {
        type: Object,
        required: true
    }
})

const toast = useToast()
const confirm = useConfirm()

// Methods
const goBack = () => {
    router.visit('/cms/qa')
}

const editQA = () => {
    router.visit(`/cms/qa/${props.qa.id}/edit`)
}

const toggleStatus = async () => {
    try {
        await router.put(`/cms/qa/${props.qa.id}/toggle-status`, {}, {
            onSuccess: () => {
                toast.add({
                    severity: 'success',
                    summary: 'Success',
                    detail: `Q&A ${props.qa.status ? 'deactivated' : 'activated'} successfully`,
                    life: 3000
                })
                // Reload the page to get updated data
                router.reload()
            },
            onError: () => {
                toast.add({
                    severity: 'error',
                    summary: 'Error',
                    detail: 'Failed to update status',
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

const deleteQA = () => {
    confirm.require({
        message: 'Are you sure you want to delete this Q&A? This action cannot be undone.',
        header: 'Confirm Delete',
        icon: 'pi pi-exclamation-triangle',
        acceptClass: 'p-button-danger',
        accept: async () => {
            try {
                await router.delete(`/cms/qa/${props.qa.id}`, {
                    onSuccess: () => {
                        toast.add({
                            severity: 'success',
                            summary: 'Success',
                            detail: 'Q&A deleted successfully',
                            life: 3000
                        })
                        router.visit('/cms/qa')
                    },
                    onError: () => {
                        toast.add({
                            severity: 'error',
                            summary: 'Error',
                            detail: 'Failed to delete Q&A',
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

const duplicateQA = () => {
    router.visit('/cms/qa/create', {
        data: {
            question: props.qa.question,
            answer: props.qa.answer,
            status: props.qa.status
        }
    })
}

const formatDate = (dateString) => {
    return new Date(dateString).toLocaleDateString('vi-VN', {
        year: 'numeric',
        month: '2-digit',
        day: '2-digit',
        hour: '2-digit',
        minute: '2-digit',
        second: '2-digit'
    })
}
</script>

<style scoped>
.space-y-4 > * + * {
    margin-top: 1rem;
}

.space-y-3 > * + * {
    margin-top: 0.75rem;
}
</style>