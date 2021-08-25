<template>
  <a-card class="user-details mt-3" :body-style="{padding: '4px'}">
    <div class="user-account">
      <div class="account-header">
        <h4 class="pb-2">Financial Details
          <div class="float-right">
            <a href="Cancel" v-if="profile" @click.prevent="profile = false"><span>Cancel</span></a>
            <a href="Edit" v-else @click.prevent="profile = true"><span>Edit</span></a>
          </div>
        </h4>
      </div>
      <a-form-model class="pt-3 pb-4" ref="ruleForm" :model="form" :rules="rules" layout="vertical"
                    @submit.prevent="onSubmit()"
                    @keydown="form.onKeydown($event)" :hideRequiredMark="true">
        <a-descriptions>
          <a-descriptions-item v-if="profile">
            <a-form-model-item label="Type of ID :" ref="id_type" prop="id_type">
              <a-select v-model="form.id_type" placeholder="Select your ID" style="width: 200px">
                <a-select-option :value="1">
                  Passport
                </a-select-option>
                <a-select-option :value="2">
                  Driving License
                </a-select-option>
                <a-select-option :value="3">
                  Voter ID
                </a-select-option>
              </a-select>
            </a-form-model-item>
          </a-descriptions-item>
          <a-descriptions-item v-else label="Type of ID">
            {{
              financial.id_type === 1 ? 'Passport' : financial.id_type === 2 ? 'Driving License' : financial.id_type === 3 ? 'Voter ID' : ''
            }}
          </a-descriptions-item>
          <a-descriptions-item v-if="profile">
            <a-form-model-item label="ID Code :" ref="id_code" prop="id_code">
              <a-input v-model="form.id_code" placeholder="Enter your ID Code"/>
            </a-form-model-item>
          </a-descriptions-item>
          <a-descriptions-item v-else label="ID Code">
            {{ financial.id_code }}
          </a-descriptions-item>
          <a-descriptions-item v-if="profile">
            <a-form-model-item label="Bank Name :" ref="bank_name" prop="bank_name">
              <a-input v-model="form.bank_name" placeholder="Enter your bank name"/>
            </a-form-model-item>
          </a-descriptions-item>
          <a-descriptions-item v-else label="Bank Name">
            {{ financial.bank_name }}
          </a-descriptions-item>
          <a-descriptions-item v-if="profile">
            <a-form-model-item label="Branch Name :" ref="bank_branch_name" prop="bank_branch_name">
              <a-input v-model="form.bank_branch_name" placeholder="Enter your branch name"/>
            </a-form-model-item>
          </a-descriptions-item>
          <a-descriptions-item v-else label="Branch Name">
            {{ financial.bank_branch_name }}
          </a-descriptions-item>
          <a-descriptions-item v-if="profile">
            <a-form-model-item label="Bank Account Name :" ref="bank_account_name" prop="bank_account_name">
              <a-input v-model="form.bank_account_name" placeholder="Enter your bank account name"/>
            </a-form-model-item>
          </a-descriptions-item>
          <a-descriptions-item v-else label="Bank Account Name">
            {{ financial.bank_account_name }}
          </a-descriptions-item>
          <a-descriptions-item v-if="profile">
            <a-form-model-item label="Bank Account Number :" ref="bank_account_number" prop="bank_account_number">
              <a-input v-model="form.bank_account_number" placeholder="Enter your bank account number"/>
            </a-form-model-item>
          </a-descriptions-item>
          <a-descriptions-item v-else label="Bank Account Number">
            {{ financial.bank_account_number }}
          </a-descriptions-item>
          <a-descriptions-item v-if="profile">
            <a-form-model-item label="Bank Routing Number :" ref="bank_routing_number" prop="bank_routing_number">
              <a-input v-model="form.bank_routing_number" placeholder="Enter your bank routing number"/>
            </a-form-model-item>
          </a-descriptions-item>
          <a-descriptions-item v-else label="Bank Routing Number">
            {{ financial.bank_routing_number }}
          </a-descriptions-item>
          <a-descriptions-item v-if="profile">
            <a-form-model-item label="TIN Number :" ref="tin_number" prop="tin_number">
              <a-input v-model="form.tin_number" placeholder="Enter your TIN number"/>
            </a-form-model-item>
          </a-descriptions-item>
          <a-descriptions-item v-else label="TIN Number">
            {{ financial.tin_number }}
          </a-descriptions-item>
        </a-descriptions>
        <div class="row" v-if="profile">
          <div class="col-12">
            <a-button htmlType="submit" class="px-5 text-white" size="large" :loading="form.busy"
                      style="background-color: #6aa1cf"
                      :disabled="form.busy">Update Financial Details
            </a-button>
          </div>
        </div>
      </a-form-model>
    </div>
  </a-card>
</template>

<script>
import {mapGetters} from "vuex";

export default {
  name: "FinancialDetails",
  data() {
    return {
      profile: false,
      form: new Form({
        id_type: undefined,
        id_code: '',
        bank_name: '',
        bank_branch_name: '',
        bank_account_name: '',
        bank_account_number: '',
        bank_routing_number: '',
        tin_number: '',
      }),
      rules: {
        id_type: [
          {required: true, message: 'Please select your ID type', trigger: 'blur'},
        ],
        id_code: [
          {required: true, message: 'Please enter your ID code', trigger: 'blur'},
          {max: 50, message: 'ID code maximum length 50 character', trigger: 'change'},
        ],
        bank_name: [
          {max: 50, message: 'Bank name maximum length 50 character', trigger: 'change'},
        ],
        bank_branch_name: [
          {max: 50, message: 'Branch name maximum length 50 character', trigger: 'change'},
        ],
        bank_account_name: [
          {max: 50, message: 'Bank account name maximum length 50 character', trigger: 'change'},
        ],
        bank_account_number: [
          {max: 50, message: 'Bank account number maximum length 50 character', trigger: 'change'},
        ],
        bank_routing_number: [
          {max: 50, message: 'Bank routing number maximum length 50 character', trigger: 'change'},
        ],
        tin_number: [
          {max: 50, message: 'TIN number maximum length 50 character', trigger: 'change'},
        ],
      }
    }
  },
  methods: {
    onSubmit() {
      this.$refs.ruleForm.validate(valid => {
        if (valid) {
          this.form.post('financial-update')
              .then(() => {
                this.$notification['success']({
                  message: 'congratulations',
                  description: 'Financial Details update successfully.',
                  style: {marginTop: '200px'},
                });
                this.$store.dispatch('VERIFY_AUTH');
                this.profile = false;
              })
              .catch(err => {
                this.$notification['error']({
                  message: 'Warning',
                  description: ((err.response || {}).data || {}).message || 'Something Wrong',
                  style: {marginTop: '200px'},
                  duration: 5
                })
              })
        } else {
          return false;
        }
      });
    }
  },
  created() {
    this.form.fill(this.financial);
    this.form.id_type = this.financial.id_type ? this.financial.id_type : undefined;
  },
  watch: {
    financial: function () {
      this.form.fill(this.financial);
      this.form.id_type = this.financial.id_type ? this.financial.id_type : undefined;
    },
    profile: function () {
      this.form.fill(this.financial);
      this.form.id_type = this.financial.id_type ? this.financial.id_type : undefined;
    }
  },
  computed: {
    ...mapGetters({financial: "userFinancial"})
  }
}
</script>

<style scoped>

</style>
