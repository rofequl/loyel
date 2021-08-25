<template>
  <div>
    <!-- Datatable -->
    <div id="people" class="dataTables_wrapper no-footer">
      <v-client-table ref="table" :data="wishList" :columns="columns" :options="options" class="text-center"></v-client-table>
    </div>
    <!-- End Datatable -->
  </div>
</template>

<script>
export default {
  name: "CustomerWishlist",
  props: {
    wishList: {
      required: true
    },
  },
  computed: {
    columns() {
      return ['name', 'sku'];
    },
    options() {
      return {
        headings: {
          name: 'Products Name',
          sku: 'SKU',
        },
        filterable: ['name']
      }
    }
  }
}
</script>

<style scoped>

</style>
