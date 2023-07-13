<script setup>
defineProps({
	field: {
		type: String,
		required: false,
		default: "id"
	},
	text: {
		type: String,
		required: true,
		default: "[text]"
	}
})
</script>

<template>
	<span class="acc" id="{{'acc-' + field}}">{{ text }}</span>
</template>
