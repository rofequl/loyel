<template>
  <CCard>
    <CCardHeader>
      <strong> Top selling product list </strong>
      <small>all time</small>
      <div class="card-header-actions">
        <a-dropdown>
          <a class="ant-dropdown-link" @click="e => e.preventDefault()">
            <CIcon name="cil-settings"/>
          </a>
          <a-menu slot="overlay">
            <a-menu-item>
              <a href="javascript:;">all time</a>
            </a-menu-item>
            <a-menu-item>
              <a href="javascript:;">this year</a>
            </a-menu-item>
            <a-menu-item>
              <a href="javascript:;">this month</a>
            </a-menu-item>
          </a-menu>
        </a-dropdown>
      </div>
    </CCardHeader>
    <CCardBody>
      <CListGroup>
        <CListGroupItem class="d-flex justify-content-between align-items-center" v-for="(product, i) in topSelling"
                        :key="i">
          {{ product.name }}
          <CBadge color="primary" shape="pill">{{ product.total_sell }}</CBadge>
        </CListGroupItem>
      </CListGroup>
    </CCardBody>
  </CCard>
</template>

<script>
export default {
  props: ['topSelling'],
  name: "TopSelling"
}
</script>

<style scoped>

</style>