<template>
  <div class="vertical-sidebar" id="slideNav">
    <div class="sidebar-content">
      <div class="brand-logo">
        <router-link to="/"><img :src="showImage(generalSettings.logo_black)" alt=""></router-link>
        <span class="close-icon d-md-none float-right mr-2" onclick="menuAnimation(this)">
                    <i class="fa fa-times"></i>
                </span>
      </div>
      <div class="seller-thumb">

      </div>
      <div class="sidebar-menu">
        <div class="menu-title">
          <p>Main Navigation</p>
        </div>
        <ul class="menu-list">
          <li>
            <router-link to="/seller/dashboard"><span><i class="fa fa-dashcube"></i></span><span>Dashboard</span>
            </router-link>
          </li>
          <li>
            <router-link to="/seller/account"><span><i class="fa fa-user-circle"></i></span><span>Profile</span>
            </router-link>
          </li>
          <li>
            <router-link to="/seller/store"><span><i class="fa fa-address-card"></i></span><span>Your Store</span>
            </router-link>
          </li>
          <li v-if="isSellerAccess">
            <router-link to="/seller/product-list"><span><i class="fa fa-shopping-basket"></i></span><span>Product Management</span>
            </router-link>
          </li>
          <li v-if="isSellerAccess"><a href="#0"><span><i class="fa fa-shopping-cart"></i></span><span>Order Management</span></a></li>
          <li v-if="isSellerAccess"><a href="#0"><span><i class="fa fa-file"></i></span><span>Invoice Setting</span></a></li>
          <li v-if="isSellerAccess"><a href="#0"><span><i class="fa fa-sitemap"></i></span><span>Shopping Information</span></a></li>
          <li><router-link to="/seller/account-management"><span><i class="fa fa-tasks"></i></span><span>Account Management</span></router-link></li>
        </ul>
      </div>

    </div>
  </div>
</template>

<script>
import {mapGetters} from "vuex";

export default {
  name: "Sidebar",
  computed: {
    ...mapGetters(["generalSettings", "isSellerAccess"])
  },
}
</script>

<style scoped>

</style>
