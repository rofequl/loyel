<template>
  <!-- HEADER AREA START -->
  <header>

    <!--        ********************* top part start *************************-->
    <div class="main-menubar">
      <nav class="navbar navbar-expand-lg d-block">
        <ul class="nav justify-content-end">
          <li class="nav-item" v-if="isBangla">
            <a @click.prevent="$store.dispatch('setLang','bn-BD')" v-if="lang === 'en-US'"
               class="nav-link top-nav-link py-0 text-muted">বাংলা</a>
            <a @click.prevent="$store.dispatch('setLang','en-US')" v-else class="nav-link top-nav-link py-0 text-muted">English</a>
          </li>
          <li class="nav-item">
            <router-link class="nav-link top-nav-link py-0 text-muted" to="/seller-entry">
              {{ $t('header.sell', {msg: isLangBn ? generalSettings.app_name_bd : generalSettings.app_name}) }}
            </router-link>
          </li>
          <li class="nav-item">
            <a class="nav-link top-nav-link py-0 text-muted" href="#">{{ $t('header.customer') }}</a>
          </li>
          <li class="nav-item">
            <router-link class="nav-link top-nav-link py-0 text-muted" to="/faq">FAQ</router-link>
          </li>
        </ul>
      </nav>
    </div>
    <!--        ********************* top part end ***************************-->

    <!-- MAIN MENUBAR AREA START -->
    <div class="main-menubar">
      <nav class="navbar navbar-expand-lg menu fixed" :class="{topHeaderBG : scrolling}">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01"
                aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
          <i class="navbar-icon fa fa-bars"></i>
        </button>
        <router-link class="navbar-brand logo-right" to="/">
          <img :src="showImage(generalSettings.logo_black)" width="90px" height="20px" alt="Loyer Logo">
        </router-link>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo01">


          <Search/>


          <ul class="navbar-nav right-nav mt-2 mt-lg-0">
            <li class="nav-item">
              <router-link to="/cart" class="nav-link">
                <a-badge class="pointer" :count="cartProductCount"
                         :number-style="{ backgroundColor: '#b4f54c', color: 'white'}">
                  <a-avatar :size="34" class="shopping-cart" shape="square" icon="shopping-cart"/>
                </a-badge>
              </router-link>
            </li>
            <li class="nav-item">
              <router-link to="/wishlist" class="nav-link">
                <a-badge class="pointer" :count="totalWishlist"
                         :number-style="{ backgroundColor: '#b4f54c', color: 'white'}">
                  <a-avatar :size="34" class="shopping-cart" shape="square" icon="heart"/>
                </a-badge>
              </router-link>
            </li>
            <li class="nav-item" v-if="isAuthenticated">
              <a-dropdown overlayClassName="header-droupdown">
                <router-link to="/notification" class="nav-link">
                  <a-badge class="pointer" :count="totalNotification"
                           :number-style="{ backgroundColor: '#b4f54c', color: 'white'}">
                    <a-avatar :size="34" class="shopping-cart" shape="square" icon="bell"/>
                  </a-badge>
                </router-link>
                <a-menu slot="overlay" style="font-size: 12px" class="pb-0">
                  <a-menu-item v-for="(notification, i) in notificationList" :key="i" style="white-space: normal">
                    <small class="pb-0">{{ notification.created_at }}</small><br>
                    {{ notification.message }}
                  </a-menu-item>
                  <a-menu-item v-if="notificationList.length === 0">
                    <h6>You have no any notification</h6>
                  </a-menu-item>
                  <a-menu-item v-else class="text-center font-weight-bold dropdownStyle">
                    <router-link to="/notification">See all Notification</router-link>
                  </a-menu-item>
                </a-menu>
              </a-dropdown>
            </li>
            <li class="nav-item">
              <a-dropdown overlayClassName="header-droupdown">
                <router-link to="/profile" class="nav-link ant-dropdown-link"
                             @click="e => e.preventDefault()">
                  <i class="fa fa-user-circle-o"></i>
                  <br>
                </router-link>
                <a-menu slot="overlay" style="font-size: 12px">
                  <a-menu-item class="text-center" v-if="!isCustomerOrLogin" style="width: 250px">
                    <span style="font-size: 10px;white-space: normal">
                      <span
                          class="font-weight-bold">Welcome to {{
                          $store.getters.generalSettings.app_name
                        }} Shopping</span><br>
                      Sign Up or Login for a personalised experience and faster checkout!
                    </span>
                    <a-button type="danger" class="mt-2" @click="$router.push('/login')">
                      Login / Sign-up
                    </a-button>
                  </a-menu-item>
                  <a-menu-item class="text-center" v-if="isCustomerOrLogin">
                    <b>Hi there</b><br>Manage your orders and account
                  </a-menu-item>
                  <a-menu-divider v-if="isCustomerOrLogin"/>
                  <a-menu-item v-if="isCustomerOrLogin">
                    <router-link to="/profile">Account</router-link>
                  </a-menu-item>
                  <a-menu-item v-if="isCustomerOrLogin">
                    <router-link to="/order">Orders</router-link>
                  </a-menu-item>
                  <a-menu-item v-if="isCustomerOrLogin">
                    Wishlist
                  </a-menu-item>
                  <a-menu-divider v-if="isCustomerOrLogin"/>
                  <a-menu-item v-if="isCustomerOrLogin">
                    <a href="logout" @click.prevent="onLogout">Logout</a>
                  </a-menu-item>
                </a-menu>
              </a-dropdown>
            </li>


          </ul>
        </div>
      </nav>

    </div>
    <!-- MAIN MENUBAR AREA END-->

    <!--        ********************* menu part start *************************-->
    <CategoryMenu/>
    <!--        ********************* menu part end ***************************-->
  </header>
  <!-- HEADER AREA END -->
</template>

<script>
import {mapGetters} from 'vuex';
import Search from "@/components/layout/Search";
import CategoryMenu from "@/components/layout/CategoryMenu";

export default {
  name: "Header",
  components: {CategoryMenu, Search},
  data() {
    return {
      scrolling: true,
    }
  },
  created() {
    window.addEventListener('scroll', this.handleScroll);
    if (!this.categoryList.length > 0) this.$store.dispatch('CATEGORY_LIST');
    if (!this.subcategoryList.length > 0) this.$store.dispatch('SUBCATEGORY_LIST');
    if (!this.subsubcategoryList.length > 0) this.$store.dispatch('SUBSUBCATEGORY_LIST');
  },
  methods: {
    handleScroll() {
      if (window.scrollY > 20) {
        this.scrolling = false
      } else {
        this.scrolling = true
      }
    },
    onLogout() {
      this.$store.dispatch('LOGOUT')
    },
  },
  computed: {
    ...mapGetters(["generalSettings", "subcategoryList", "subsubcategoryList", "categoryList", "isBangla", "isCustomerOrLogin",
      "lang", "isLangBn", "cartProductCount", "totalWishlist", "isAuthenticated", "totalNotification", "notificationList"])
  },
}
</script>

<style scoped>
.topHeaderBG {
  background: #f1f1f1;
  box-shadow: none !important;
  top: 22px;
}

.main-menubar .navbar {
  box-shadow: 0 3px 11px -5px rgb(0 0 0 / 30%);
  transition: .2s;
}

.top-nav-link {
  font-size: 12px;
}

.menu-content a {
  font-size: 13px !important;
  color: #3b3c42 !important;
  overflow: hidden;
  text-overflow: ellipsis;
  line-height: 20px;
  display: -webkit-box;
  -webkit-line-clamp: 1; /* number of lines to show */
  -webkit-box-orient: vertical;
}

.menu-content a:hover {
  color: #ff0000 !important;
}

.dropdowns:hover .dropdown-content {
  display: block;
}

.shopping-cart {
  background: transparent;
  color: #d00400;
  margin-top: -5px;
}

.shopping-cart >>> i {
  font-size: 32px;
}

.dropdownStyle {
  background-color: #cdcedb;
}

.dropdownStyle:hover {
  background-color: #bbbcde !important;
}

</style>
