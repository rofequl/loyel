<template>
  <div>
    <a-spin tip="Loading..." :spinning="loading">
      <DashboardTotal v-if="dashboardList.totalData" :total-data="dashboardList.totalData"/>
      <CCardGroup columns class="card-columns cols-2">
        <CCard>
          <CCardHeader>Selling Bar Chart</CCardHeader>
          <CCardBody>
            <ChartBar/>
          </CCardBody>
        </CCard>
        <TopSelling v-if="dashboardList.top_sell" :top-selling="dashboardList.top_sell"/>
      </CCardGroup>
      <UserPurchase v-if="dashboardList.latest_order" :latest-order="dashboardList.latest_order"/>
    </a-spin>
  </div>
</template>

<script>
import ChartBar from "@/components/dashboard/ChartBar";
import UserPurchase from "@/components/dashboard/UserPurchase";
import DashboardTotal from "@/components/dashboard/DashboardTotal";
import {mapGetters} from "vuex";
import TopSelling from "@/components/dashboard/TopSelling";

export default {
  name: "Dashboard",
  data() {
    return {
      loading: false,
    };
  },
  async mounted() {
    this.loading = true
    if (!this.dashboardList.length > 0) await this.$store.dispatch('DASHBOARD_LIST');
    this.loading = false
  },
  computed: {
    ...mapGetters(["dashboardList"]),
  },
  components: {TopSelling, UserPurchase, ChartBar, DashboardTotal}
}
</script>

<style scoped>

</style>
