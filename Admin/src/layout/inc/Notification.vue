<template>
  <CDropdown
      inNav
      class="c-header-nav-items mr-5"
      placement="bottom-end"
      add-menu-classes="pt-0">
    <template #toggler>
      <CHeaderNavLink>
        <CIcon name="cil-bell"/>
      </CHeaderNavLink>
    </template>
    <CDropdownItem class="pt-0 border-bottom" v-for="(notification, i) in notificationList" :key="i">
      <small class="text-muted">{{notification.created_at}}</small><br>
      <p style="white-space: break-spaces">{{notification.message}}</p>
    </CDropdownItem>
    <CDropdownHeader tag="div" class="text-center" color="light">
      <strong class="pointer" @click="$router.push('/notification')">See all notification</strong>
    </CDropdownHeader>
  </CDropdown>
</template>

<script>
import {mapGetters} from "vuex";

export default {
  name: "Notification",
  computed: {
    ...mapGetters(["notificationList"]),
  }
}
</script>

<style scoped>
>>> .dropdown-menu {
  width: 300px !important;
  padding-bottom: 0 !important;
}
</style>