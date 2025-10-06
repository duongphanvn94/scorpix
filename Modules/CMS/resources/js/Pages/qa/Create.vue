<template>
    <div class="card">
        <div class="mb-6">
            <div class="flex items-center gap-2 mb-2">
                <Button @click="goBack" icon="pi pi-arrow-left" class="p-button-text p-button-plain" />
                <h1 class="text-2xl font-bold text-gray-900">Create Q&A</h1>
            </div>
            <p class="text-gray-600">Add a new question and answer</p>
        </div>

        <form @submit.prevent="submitForm" class="max-w-2xl">
            <div class="field mb-6">
                <label for="question" class="block text-sm font-medium text-gray-700 mb-2">Question *</label>
                <Textarea id="question" v-model="form.question" rows="4" 
                    placeholder="Enter the question..." required 
                    :class="{'p-invalid': errors.question}" 
                    class="w-full" />
                <small v-if="errors.question" class="p-error">{{ errors.question[0] }}</small>
            </div>
            
            <div class="field mb-6">
                <label for="answer" class="block text-sm font-medium text-gray-700 mb-2">Answer *</label>
                <Textarea id="answer" v-model="form.answer" rows="8" 
                    placeholder="Enter the answer..." required 
                    :class="{'p-invalid': errors.answer}" 
                    class="w-full" />
                <small v-if="errors.answer" class="p-error">{{ errors.answer[0] }}</small>
                <small class="text-gray-500">You can use line breaks for better formatting</small>
            </div>
            
            <div class="field mb-6">
                <div class="flex items-center">
                    <Checkbox id="status" v-model="form.status" :binary="true" />
                    <label for="status" class="ml-2 text-sm font-medium text-gray-700">Active</label>
                </div>
                <small class="text-gray-500 block mt-1">Active Q&As will be visible to users</small>
            </div>
            
            <div class="flex gap-3">
                <Button @click="goBack" label="Cancel" class="p-button-outlined" type="button" />
                <Button :loading="submitting" type="submit" label="Create Q&A" class="p-button-primary" />
            </div>
        </form>
    </div>
</template>

<script setup>
import { reactive, ref } from 'vue'
import { router } from '@inertiajs/vue3'
import { useToast } from 'primevue/usetoast'
import Button from 'primevue/button'
import Textarea from 'primevue/textarea'
import Checkbox from 'primevue/checkbox'

const toast = useToast()

// Data
const submitting = ref(false)
const errors = ref({})

// Form
const form = reactive({
    question: '',
    answer: '',
    status: true
})

// Methods
const submitForm = async () => {
    submitting.value = true
    errors.value = {}
    
    try {
        await router.post('/cms/qa', {
            question: form.question,
            answer: form.answer,
            status: form.status
        }, {
            onSuccess: () => {
                toast.add({
                    severity: 'success',
                    summary: 'Success',
                    detail: 'Q&A created successfully',
                    life: 3000
                })
                router.visit('/cms/qa')
            },
            onError: (responseErrors) => {
                errors.value = responseErrors
                toast.add({
                    severity: 'error',
                    summary: 'Error',
                    detail: 'Please check the form for errors',
                    life: 3000
                })
            }
        })
    } catch (error) {
        toast.add({
            severity: 'error',
            summary: 'Error',
            detail: 'Failed to create Q&A',
            life: 3000
        })
    } finally {
        submitting.value = false
    }
}

const goBack = () => {
    router.visit('/cms/qa')
}
</script>

<style scoped>
.field {
    margin-bottom: 1.5rem;
}
</style>