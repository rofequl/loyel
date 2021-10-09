<template>
  <div>
    <!-- Page Header -->
    <div class="row">
      <div class="col-12 col-sm-6 text-center text-sm-left mb-4 mb-sm-0">
        <span class="text-uppercase page-subtitle">System User Access
        </span>
        <h3 class="page-title">User Management</h3>
      </div>
      <div class="col-12 col-sm-6 d-flex align-items-center">
        <div class="mx-auto ml-sm-auto mr-sm-0">
          <CButton @click="$refs.child.modal()" block size="sm" color="info">Add New User</CButton>
        </div>
      </div>
    </div>
    <!-- End Page Header -->
    <!-- Datatable -->
    <div id="people" class="dataTables_wrapper no-footer my-5">
      <v-client-table :data="userList" :columns="columns" :options="options" class="text-center" ref="table">
        <div slot="serial" slot-scope="props">
          {{ userListIndex(props.row.id) }}
        </div>
        <div slot="photo" slot-scope="props">
          <img :src="showImage(props.row.photo)" width="60px" class="avatar img-fluid img-thumbnail">
        </div>
        <div slot="role" slot-scope="props">
          <a-tag :color="randomColor()">{{ props.row.role }}</a-tag>
        </div>
        <div slot="status" slot-scope="props">
          <a-switch checked-children="Yes" un-checked-children="No"
                    :checked="props.row.status === 0" @change="value => onChange(value, props.row.id)"/>
        </div>
        <div slot="action" slot-scope="props">
          <a-button-group>
            <a-button @click="$refs.child.modal(props.row)" icon="edit"/>
            <a-popconfirm placement="topRight"
                          title="Are you sure delete this user?"
                          ok-text="Yes"
                          cancel-text="No"
                          @confirm="confirm(props.row.id)">
              <a-button icon="delete"/>
            </a-popconfirm>
          </a-button-group>
        </div>
      </v-client-table>
    </div>
    <!-- End Datatable -->
    <!-- Modal -->
    <user-add ref="child"/>
    <!-- End Modal -->
  </div>
</template>

<script>
import {mapActions, mapGetters} from "vuex";
import UserAdd from "@/components/account/UserAdd";
import ApiService from "@/core/services/api.service";

export default {
  name: "UserManage",
  components: {UserAdd},
  async mounted() {
    this.$refs.table.setLoadingState(true)
    if (!this.userList.length > 0) await this.$store.dispatch('USER_LIST');
    this.$refs.table.setLoadingState(false)
  },
  methods: {
    ...mapActions(['USER_BLOCK']),
    onChange(checked, id) {
      const {USER_BLOCK} = this;
      if (checked)
        USER_BLOCK({active: 0, id: id})
      else
        USER_BLOCK({active: 1, id: id})
    },
    confirm(id) {
      ApiService.delete('user/' + id)
          .then((data) => {
            if (data.data.data === 'Error') {
              this.$notification['error']({
                message: 'Warning',
                description: data.data.message,
                style: {marginTop: '41px'},
              });
            } else {
              this.$store.commit('USER_REMOVE', id);
              this.$notification['success']({
                message: 'Congratulations user deleted',
                description: data.data.message,
                style: {marginTop: '41px'},
              });
            }
          })
          .catch((err) => {
            this.$notification['error']({
              message: 'Warning',
              description: ((err.response || {}).data || {}).message || 'Something Wrong',
              style: {marginTop: '41px'},
              duration: 4
            })
          })
    },
    randomColor() {
      return "#" + Math.floor(Math.random() * 16777215).toString(16);
    }
  },
  computed: {
    ...mapGetters(["userList", "userListIndex"]),
    columns() {
      return ['serial', 'photo', 'name', 'email', 'role', 'status', 'action']
    },
    options() {
      return {
        headings: {
          serial: '#',
          name: 'Name',
          photo: 'Image',
          status: 'Block',
        },
        sortable: ['name'],
        filterable: ['name', 'email']
      }
    }
  }
}
</script>

<style scoped>

</style>