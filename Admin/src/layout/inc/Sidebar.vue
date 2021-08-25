<template>
  <CSidebar
      fixed
      :minimize="minimize"
      :show="show"
      @update:show="(value) => $store.commit('set', ['sidebarShow', value])"
  >
    <CSidebarBrand class="d-md-down-none" to="/">
      <img v-if="$store.getters.generalSettings.logo_white" :src="showImage($store.getters.generalSettings.logo_white)" height="54" class="c-sidebar-brand-full">

      <img v-if="$store.getters.generalSettings.favicon" :src="showImage($store.getters.generalSettings.favicon)" height="35" class="c-sidebar-brand-minimized">
    </CSidebarBrand>

    <CRenderFunction flat :content-to-render="$options.nav"/>
  </CSidebar>
</template>

<script>
import nav from './_nav'

export default {
  name: "Sidebar",
  nav,
  computed: {
    show() {
      return this.$store.state.sidebarShow
    },
    minimize() {
      return this.$store.state.sidebarMinimize
    }
  },
}
</script>

<style scoped>

</style>
