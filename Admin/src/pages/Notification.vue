<template>
  <div>
    <CRow class="justify-content-center">
      <CCol md="6">
        <CCard>
          <CCardHeader>
            <CIcon name="cil-bell"/>
            <strong> All Notification </strong>
          </CCardHeader>
          <CCardBody class="p-0">
            <CListGroup>
              <CListGroupItem class="flex-column" v-for="(notification, i) in allNotificationList" :key="i">
                <div class="w-100">
                  <small>{{notification.created_at}}</small>
                  <p class="mb-1">{{notification.message}}</p>
                </div>
              </CListGroupItem>
            </CListGroup>
          </CCardBody>
        </CCard>
      </CCol>
    </CRow>
  </div>
</template>

<script>
import {mapGetters} from "vuex";

export default {
  name: "Notification",
  data() {
    return {
      loading: false,
    }
  },
  async mounted() {
    this.loading = true;
    if (!this.allNotificationList.length > 0) await this.$store.dispatch('NOTIFICATION_LIST');
    this.loading = false;
  },
  computed: {
    ...mapGetters(["allNotificationList"]),
  }
}
</script>

<style scoped>

</style>