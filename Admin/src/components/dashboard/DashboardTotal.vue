<template>
  <CRow>
    <CCol col="12" sm="6" lg="3">
      <CWidgetIcon class="pointer" @click.native="$router.push({name: 'category'})"
                   :header="totalData.categories.toString()"
                   text="Category"
                   color="gradient-primary"
      >
        <CIcon name="cil-bookmark" width="24"/>
      </CWidgetIcon>
    </CCol>
    <CCol col="12" sm="6" lg="3">
      <CWidgetIcon class="pointer" @click.native="$router.push({name: 'brand'})"
                   :header="totalData.brands.toString()"
                   text="Brands"
                   color="gradient-info"
      >
        <CIcon name="cil-bold" width="24"/>
      </CWidgetIcon>
    </CCol>
    <CCol col="12" sm="6" lg="3">
      <CWidgetIcon class="pointer" @click.native="$router.push({name: 'product-list'})"
                   :header="totalData.products.toString()"
                   text="Product"
                   color="gradient-warning"
      >
        <CIcon name="cil-3d" width="24"/>
      </CWidgetIcon>
    </CCol>
    <CCol col="12" sm="6" lg="3">
      <CWidgetIcon class="pointer" @click.native="$router.push({name: 'Quotation'})"
                   :header="totalData.quotations.toString()"
                   text="RFQ"
                   color="gradient-danger"
      >
        <CIcon name="cil-touch-app" width="24"/>
      </CWidgetIcon>
    </CCol>
    <CCol col="12" sm="6" lg="3">
      <CWidgetIcon class="pointer" @click.native="$router.push({name: 'customer-list'})"
                   :header="totalData.customers.toString()"
                   text="Customer"
                   color="gradient-primary"
      >
        <CIcon name="cil-user" width="24"/>
      </CWidgetIcon>
    </CCol>
    <CCol col="12" sm="6" lg="3">
      <CWidgetIcon class="pointer" @click.native="$router.push({name: 'all-orders'})"
                   :header="totalData.pending_orders.toString()"
                   text="Pending Orders"
                   color="gradient-info"
      >
        <CIcon name="cil-thumb-down" width="24"/>
      </CWidgetIcon>
    </CCol>
    <CCol col="12" sm="6" lg="3">
      <CWidgetIcon class="pointer" @click.native="$router.push({name: 'all-orders'})"
                   :header="totalData.total_sales.toString()"
                   text="Total Sales"
                   color="gradient-warning"
      >
        <CIcon name="cil-cart" width="24"/>
      </CWidgetIcon>
    </CCol>
    <CCol col="12" sm="6" lg="3">
      <CWidgetIcon
          :header="numberWithCommas(totalData.revenue).toString()"
          text="revenue"
          color="gradient-danger"
      >
        <CIcon name="cil-credit-card" width="24"/>
      </CWidgetIcon>
    </CCol>
  </CRow>
</template>

<script>
export default {
  props: ['totalData'],
  name: "DashboardTotal",
  methods: {
    onClick() {
      console.log('ok');
    }
  }
}
</script>

<style scoped>

</style>
