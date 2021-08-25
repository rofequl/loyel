<template>
  <div class="top-navbar">
    <div class="container-fluid p-0">
      <div class="nav-item">
        <div class="nav-toggle" onclick="menuAnimation(this)">
          <i class="fa fa-times"></i>
        </div>
        <div class="menu-item">
          <ul class="item-list" id="topList">
            <li>
              <a-dropdown overlayClassName="header-droupdown">
                <router-link to="/seller/dashboard">
                  <span><a-avatar :src="user.photo_type === 0? showImage(user.photo):user.photo" alt="user-image" size="large"/></span>
                  <span class="ml-1">{{ user.name }}</span>
                </router-link>
                <a-menu slot="overlay" style="font-size: 12px">
                  <a-menu-item style="width: 250px">
                    <span style="font-size: 10px;white-space: normal">
                      <span
                          class="font-weight-bold">{{store.shop_name}}</span><br>
                      Seller ID : {{ user.seller_id }}
                    </span><br>
                    <a-tag color="#87d068" v-if="user.seller_verify === 0">Unverified</a-tag>
                    <a-tag color="#108ee9" v-else>Verified</a-tag>
                  </a-menu-item>
                  <a-menu-divider/>
                  <a-menu-item>
                    <router-link to="/seller/account">Account</router-link>
                  </a-menu-item>
                  <a-menu-item>
                    <a href="#">Contact Us</a>
                  </a-menu-item>
                  <a-menu-item>
                    <a href="#">Terms and Conditions</a>
                  </a-menu-item>
                  <a-menu-item>
                    <a href="#">Privacy Policy</a>
                  </a-menu-item>
                  <a-menu-divider/>
                  <a-menu-item>
                    <a href="logout" @click.prevent="onLogout">Logout</a>
                  </a-menu-item>
                </a-menu>
              </a-dropdown>
            </li>
          </ul>
          <div class="top-toggle d-block d-sm-none" onclick="topNav(this)">
            <i class="fa fa-ellipsis-v"></i>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import {mapGetters} from "vuex";

export default {
  name: "Header",
  methods: {
    onLogout() {
      this.$store.dispatch('LOGOUT')
    },
  },
  computed: {
    ...mapGetters({store: "userStore", user: "currentUser"})
  }
}
</script>

<style scoped>

</style>
