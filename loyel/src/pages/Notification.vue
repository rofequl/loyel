<template>
  <div>
    <TopInfo/>
    <a-spin size="large" style="min-height: 400px" :spinning="loading" tip="Loading...">
      <a-row v-if="allNotificationList.length > 0" type="flex" justify="center">
        <a-col :xs="2" :sm="4" :md="6" :lg="8" :xl="10">
          <a-list item-layout="horizontal" :data-source="allNotificationList">
            <a-list-item slot="renderItem" slot-scope="item">
              <a-list-item-meta :description="item.message">
                <small slot="title">{{ item.created_at }}</small>
              </a-list-item-meta>
            </a-list-item>
          </a-list>
        </a-col>
      </a-row>
      <div v-else class="container my-5 text-center">
        <img src="@/assets/image/notification_empty.png" class="d-block mx-auto" width="20%">
        <h5 class="mb-2">You have no any notification</h5>
        <router-link class="text-danger font-weight-bold" to="/">START SHOPPING</router-link>
      </div>
    </a-spin>
  </div>
</template>

<script>
import TopInfo from "@/components/helper/TopInfo";
import {mapGetters} from "vuex";

export default {
  name: "Notification",
  components: {TopInfo},
  data() {
    return {
      loading: false,
    }
  },
  async mounted() {
    this.loading = true
    if (!this.allNotificationList.length > 0 && this.isAuthenticated) await this.$store.dispatch('NOTIFICATION_LIST');
    this.loading = false
  },
  computed: {
    ...mapGetters(["allNotificationList", "isAuthenticated"]),
  }
}
</script>

<style scoped>

</style>