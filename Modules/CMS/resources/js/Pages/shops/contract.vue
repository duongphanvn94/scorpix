<template>
    <div class="card">
        <Breadcrumb :items="[
        { label: 'Support' }
      ]"/>
        <p class="mt-6 text-center text-xl">
            If you need support, contract us at support@scorpix.co
        </p>
        <br>
        <p class="text-center font-bold text-xl">
            Thank you!
        </p>

    </div>
</template>

<script setup>
import {Link} from '@inertiajs/vue3';
import Breadcrumb from '../../component/Breadcrumb.vue';
</script>
