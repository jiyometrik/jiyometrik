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
	<span class="tool" id="{{'tool-' + field}}"
		><i>{{ text }}</i></span
	>
</template>
