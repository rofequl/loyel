<template>
  <!-- HEADER AREA START -->
  <header>

    <!--        ********************* top part start *************************-->
    <div class="main-menubar">
      <nav class="navbar d-block">
        <ul class="nav container justify-content-end">
          <li class="nav-item" v-if="isBangla">
            <a @click.prevent="$store.dispatch('setLang','bn-BD')" v-if="lang === 'en-US'"
               class="nav-link top-nav-link py-0 text-muted">বাংলা</a>
            <a @click.prevent="$store.dispatch('setLang','en-US')" v-else
               class="nav-link top-nav-link py-0 text-muted">English</a>
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
    <div class="main-menubar menu fixed" :class="{topHeaderBG : scrolling}">
      <div class="container">
        <div class="row">
          <div class="col-5 col-sm col-md-3 col-lg-2 col-xl-2 order-1 mt-2">
            <router-link class="navbar-brand logo-right pl-0" to="/">
              <img :src="showImage(generalSettings.logo_black)" width="90px" height="20px" alt="Loyer Logo">
            </router-link>
          </div>
          <Search/>
          <div class="col-12  col-sm-6 col-md-12 col-lg-3 col-xl mt-3 order-4 order-sm-3 order-md-4 order-lg-3 text-center text-sm-left text-md-center">
            <router-link class="text-primary-color mr-4 d-lg-none" to="/categories">
              All Category
            </router-link>
            <router-link class="text-primary-color" to="/">
              NewsFeed
            </router-link>
            <router-link class="text-primary-color ml-4" to="/">
              OfferZone
            </router-link>
          </div>
          <div class="col-7 col-sm-6 col-md-4 col-lg-2 col-xl mt-3 order-2 order-sm-4 order-md-3 order-lg-4 card-wrapper text-right">
            <router-link to="/cart">
              <a-badge class="pointer" :count="cartProductCount"
                       :number-style="{ backgroundColor: '#b4f54c', color: 'white'}">
                <a-avatar :size="31" class="shopping-cart" shape="square" icon="shopping-cart"/>
              </a-badge>
            </router-link>
            <router-link to="/wishlist">
              <a-badge class="pointer" :count="totalWishlist"
                       :number-style="{ backgroundColor: '#b4f54c', color: 'white'}">
                <a-avatar :size="31" class="shopping-cart ml-3" shape="square" icon="heart"/>
              </a-badge>
            </router-link>
            <router-link to="/notification">
              <a-badge class="pointer" :count="totalNotification"
                       :number-style="{ backgroundColor: '#b4f54c', color: 'white'}">
                <a-avatar :size="31" class="shopping-cart ml-3" shape="square" icon="bell"/>
              </a-badge>
            </router-link>
            <a-dropdown overlayClassName="header-droupdown">
              <router-link v-if="isCustomerOrLogin" to="/profile" class="ant-dropdown-link"
                           @click="e => e.preventDefault()">
                <a-badge class="pointer">
                  <a-avatar :size="31" class="shopping-cart ml-2" shape="square" icon="user"/>
                </a-badge>
              </router-link>
              <router-link v-else to="/profile" class="ant-dropdown-link ml-2" @click="e => e.preventDefault()">
                <a-badge class="pointer">
                  <a-avatar :size="31" class="shopping-cart ml-2" shape="square" icon="user"/>
                </a-badge>
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
          </div>
        </div>
      </div>
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

.menu {
  box-shadow: 0 3px 11px -5px rgb(0 0 0 / 30%);
  transition: .2s;
  padding: 10px 0;
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
  color: #7470eb;
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
