<template>
  <CHeader fixed with-subheader light>
    <CToggler
        in-header
        class="ml-3 d-lg-none"
        @click="$store.commit('toggleSidebarMobile')"
    />
    <CToggler
        in-header
        class="ml-3 d-md-down-none"
        @click="$store.commit('toggleSidebarDesktop')"
    />
    <a-tooltip placement="bottom">
      <template slot="title">
        <span>Browse Website</span>
      </template>
      <button @click="frontend" type="button" class="ml-1 d-md-down-none c-header-toggler">
        <CIcon size="lg" name="cil-globe-alt"/>
      </button>
    </a-tooltip>
    <CHeaderBrand class="mx-auto d-lg-none" to="/">
      <img height="54px" class="c-sidebar-brand-full">
    </CHeaderBrand>
    <CHeaderNav class="d-md-down-none mr-auto">

    </CHeaderNav>
    <CHeaderNav class="mr-4 correction-class">
      <notification/>
      <CDropdown
          inNav
          class="c-header-nav-items"
          placement="bottom-end"
          add-menu-classes="pt-0"
      >
        <template #toggler>
          <CHeaderNavLink>
            <div class="c-avatar">
              <img :src="showImage($store.getters.currentUser.photo)"
                   class="c-avatar-img"
              /> <span class="mx-3">{{ $store.getters.currentUser.name }}</span>
            </div>
          </CHeaderNavLink>
        </template>
        <CDropdownItem to="/user-profile">
          <CIcon name="cil-user"/>
          Profile
        </CDropdownItem>
        <CDropdownItem to="/user-manage">
          <CIcon name="cil-group"/>
          User Management
        </CDropdownItem>
        <CDropdownItem to="/role">
          <CIcon name="cil-list-numbered"/>
          Role
        </CDropdownItem>
        <CDropdownItem to="/role-permission">
          <CIcon name="cil-shield-alt"/>
          Role Permission
        </CDropdownItem>
        <CDropdownItem>
          <CIcon name="cil-settings"/>
          Settings
        </CDropdownItem>
        <CDropdownDivider/>
        <CDropdownItem @click="$store.dispatch('LOGOUT')">
          <a-icon type="logout" />
          Logout
        </CDropdownItem>
      </CDropdown>
    </CHeaderNav>
  </CHeader>
</template>

<script>
import {frontend_url} from "@/core/config/app";
import Notification from "@/layout/inc/Notification";

export default {
  name: "Header",
  components: {Notification},
  methods: {
    frontend() {
      window.open(frontend_url, "_blank");
    }
  }
}
</script>

<style scoped>

</style>
