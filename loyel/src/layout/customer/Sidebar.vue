<template>
  <div class="user-menu">
    <div class="user-item">
      <Info/>
      <div class="menu-header">
        <span>User navigation</span>
      </div>
      <div class="user-menulist">
        <ul class="list-item">
          <li>
            <router-link to="/profile">
              <button type="button" class="user-btn" :class="{active : $route.path === '/profile'}"><span><i
                  class="fa fa-user"></i></span><span>My account</span>
              </button>
            </router-link>
          </li>
          <li>
            <router-link to="/address-book">
              <button type="button" class="user-btn" :class="{active : $route.path === '/address-book'}"><span><i
                  class="fa fa-address-card"></i></span><span>Manage address</span>
              </button>
            </router-link>
          </li>
          <li>
            <router-link to="/order">
              <button type="button" class="user-btn" :class="{active : $route.path === '/order'}"><span><i
                  class="fa fa-first-order"></i></span><span>My orders</span>
              </button>
            </router-link>
          </li>
          <li>
            <router-link to="/bank-account">
              <button type="button" class="user-btn" :class="{active : $route.path === '/bank-account'}"><span><i
                  class="fa fa-dollar"></i></span><span>My bank accounts</span>
              </button>
            </router-link>
          </li>
          <li>
            <router-link to="/seller-entry">
              <button type="button" class="user-btn"><span><i class="fa fa-address-book"></i></span><span>Request seller account</span>
              </button>
            </router-link>
          </li>
          <li>
            <router-link to="/change-password">
              <button type="button" class="user-btn" :class="{active : $route.path === '/change-password'}"><span><i
                  class="fa fa-key"></i></span><span>Change password</span></button>
            </router-link>
          </li>
          <li>
            <button type="button" @click.prevent="onLogout" class="user-btn"><span><i
                class="fa fa-sign-out"></i></span><span>Sign out?</span></button>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
import Info from "@/components/customer/Info";

export default {
  name: "Sidebar",
  components: {Info},
  methods: {
    onLogout() {
      this.$store.dispatch('LOGOUT')
    },
  },
}
</script>

<style scoped>
a {
  color: #716c80 !important;
  width: 100%;
}
</style>
