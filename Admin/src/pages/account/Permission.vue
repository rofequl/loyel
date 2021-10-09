<template>
  <div>
    <!-- Page Header -->
    <div class="row">
      <div class="col-12 col-sm-6 text-center text-sm-left mb-4 mb-sm-0">
        <span class="text-uppercase page-subtitle">System User Access
        </span>
        <h3 class="page-title">Role Permission Manage</h3>
      </div>
    </div>
    <!-- End Page Header -->

    <!-- Table -->
    <div class="card card-body p-0">
      <a-table :columns="columns" :data-source="data" :pagination="false" bordered>
        <span v-for="column in columns" :slot="column.dataIndex" slot-scope="text" :key="column.dataIndex">
          <a-checkbox :id="JSON.stringify(text)" :checked="hasPermission(text)" @click="onSubmit"></a-checkbox>
        </span>
      </a-table>
    </div>
    <!-- End Table -->

  </div>
</template>

<script>
import {mapActions, mapGetters} from "vuex";

export default {
  name: "Permission",
  data() {
    return {
      data: [],
      columns: [],
      permission_list: [
        {
          id: 1,
          name: 'Product List'
        },
        {
          id: 2,
          name: 'Product Manage'
        },
        {
          id: 3,
          name: 'Brand'
        },
        {
          id: 4,
          name: 'Category'
        },
        {
          id: 5,
          name: 'Sub Category'
        },
        {
          id: 6,
          name: 'Sub SubCategory'
        },
        {
          id: 7,
          name: 'Attribute'
        },
        {
          id: 8,
          name: 'Order List'
        },
        {
          id: 9,
          name: 'Order manage'
        },
        {
          id: 10,
          name: 'Customer List'
        },
        {
          id: 11,
          name: 'Customer Manage'
        },
        {
          id: 12,
          name: 'Seller List'
        },
        {
          id: 13,
          name: 'Seller Manage'
        },
        {
          id: 14,
          name: 'Seller Commission'
        },
        {
          id: 15,
          name: 'Flash Deals'
        },
        {
          id: 16,
          name: 'Request for Commission'
        },
        {
          id: 17,
          name: 'Newsletters'
        },
        {
          id: 18,
          name: 'Bulk SMS'
        },
        {
          id: 19,
          name: 'Subscribers'
        },
        {
          id: 20,
          name: 'Coupon'
        },
        {
          id: 21,
          name: 'Shipping'
        },
        {
          id: 22,
          name: 'General Settings'
        },
        {
          id: 23,
          name: 'Pages'
        },
        {
          id: 24,
          name: 'Attribute'
        },
        {
          id: 25,
          name: 'Attribute'
        },
        {
          id: 26,
          name: 'Attribute'
        },
        {
          id: 27,
          name: 'Attribute'
        },
        {
          id: 28,
          name: 'Attribute'
        },
        {
          id: 29,
          name: 'Attribute'
        }
      ],
    };
  },
  async mounted() {
    if (!this.roleList.length > 0) await this.$store.dispatch('ROLE_LIST');
  },
  methods: {
    ...mapActions(['PERMISSION_UPDATE']),
    loadRole() {
      if (this.roleList.length > 0) {
        this.columns.push({
          title: 'Permission List / Role Name',
          dataIndex: 'name',
          key: 'name',
        });
        this.roleList.forEach(element => this.columns.push({
          title: element.name,
          dataIndex: 'k' + element.id,
          key: element.id,
          scopedSlots: {customRender: 'k' + element.id}
        }));

        this.permission_list.forEach((element) => {
          let data = element;
          data['key'] = element.id
          this.roleList.forEach(element2 => data['k' + element2.id] = {role: element2.id, permission: element.id});
          this.data.push(data)
        });

      }
    },
    onSubmit(e) {
      const {PERMISSION_UPDATE} = this;
      let id = JSON.parse(e.target.id)
      if (e.target.checked) PERMISSION_UPDATE({permission: id.permission, role: id.role, type: 'add'})
      else PERMISSION_UPDATE({permission: id.permission, role: id.role, type: 'remove'})
    },
  },
  created() {
    if (!this.permissionList.length > 0) this.$store.dispatch('PERMISSION_LIST');
    this.loadRole();
  },
  computed: {
    ...mapGetters(["roleList", "permissionList", "hasPermission"]),
  },
  watch: {
    roleList() {
      this.loadRole()
    }
  }
}
</script>

<style scoped>

</style>