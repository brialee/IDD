<template>
	<v-form class="mx-9" lazy-validation ref="form" v-model="valid">
		<p class="title">
			Front side of the form
		</p>

		<v-text-field
			filled
			label="Customer Name"
			required
			v-model="formFields.customerName"
			:counter="25"
			:rules="nameRules"
		></v-text-field>

		<v-text-field
			filled
			label="Prime"
			v-model="formFields.prime"
			:counter="8"
		></v-text-field>

		<!-- Month, Year selector -->
		<v-menu
			min-width="290px"
			offset-y
			transition="scale-transition"
			v-model="openSubmittionDate"
			:close-on-content-click="true"
			:nudge-right="40"
		>
			<template v-slot:activator="{ on }">
				<v-text-field
					label="Pay Period Month and Year"
					prepend-icon="event"
					readonly
					v-model="formFields.submissionDate"
					v-on="on"
				></v-text-field>
			</template>
			<v-date-picker
				type="month"
				v-model="formFields.submissionDate"
				@input="openSubmittedDate = false"
			></v-date-picker>
		</v-menu>
		<!-- END Month, Year selector -->

		<v-text-field
			filled
			label="Provider Name"
			required
			v-model="formFields.providerName"
			:counter="25"
			:rules="nameRules"
		></v-text-field>

		<v-text-field
			filled
			label="Provider Num"
			v-model="formFields.providerNumber"
			:counter="6"
		></v-text-field>

		<v-text-field
			filled
			label="SC/PA Name"
			v-model="formFields['SC/PA Name']"
		></v-text-field>

		<v-text-field
			filled
			label="CM Organization"
			v-model="formFields.CMOrg"
		></v-text-field>

		<v-text-field
			filled
			label="Service"
			v-model="formFields.service"
		></v-text-field>

		<!-- Table containing timesheet -->
		<FormTable :entries="formFields.serviceDeliveredOn" />
		<br />

		<v-text-field
			filled
			label="Total Hours"
			v-model="formFields.totalHours"
		></v-text-field>

		<hr />

		<p class="title">
			Back side of the form
		</p>

		<v-textarea
			auto-grow
			filled
			label="Service Goal"
			rows="1"
			v-model="formFields.service"
		></v-textarea>

		<v-textarea
			auto-grow
			filled
			label="Progress Notes"
			rows="5"
			v-model="formFields.progressNotes"
		></v-textarea>

		<hr />

		<!-- Employer Verification Section -->
		<p class="subtitle-1">
			<strong>RECIPIENT/EMPLOYER VERIFICATION:</strong><br />
			<em>
				I affirm that the data reported on this form is for actual
				dates/time worked by the provider delivering the service/supports
				listed to the recipient, that it does not exceed the total amount of
				service authorized and was delivered according to the recipient's
				service plan and provider/recipient service agreement.
			</em>
		</p>

		<v-textarea
			auto-grow
			filled
			label="Customer Employer or Employer Rep Signature"
			rows="5"
			v-model="formFields.employerSignature"
		></v-textarea>

		<!-- Date selector -->
		<v-menu
			min-width="290px"
			offset-y
			transition="scale-transition"
			v-model="openEmployerSignDate"
			:close-on-content-click="false"
			:nudge-right="40"
		>
			<template v-slot:activator="{ on }">
				<v-text-field
					label="Date"
					prepend-icon="event"
					readonly
					v-model="formFields.employerSignDate"
					v-on="on"
				></v-text-field>
			</template>
			<v-date-picker
				v-model="formFields.employerSignDate"
				@input="openEmployerSignDate = false"
			></v-date-picker>
		</v-menu>
		<!-- End Date selector -->
		<!-- End Employer Verification Section -->

		<hr />

		<!-- Provider Verification Section -->
		<p class="subtitle-1">
			<strong>PROVIDER/EMPLOYEE VERIFICATION:</strong><br />
			<em>
				I affirm that the data reported on this form is for actual
				dates/time I worked delivering the service/supports listed to the
				recipient, that it does not exceed the total amount of service
				authorized and was delivered according to the recipient's service
				plan and provider/recipient service agreement. I further acknowledge
				that reporting dates/tim worked in excess of the amount of service
				authorized or not consistent with the recipient's service plan may
				be considered Medicaid Fraud.
			</em>
		</p>

		<v-textarea
			auto-grow
			filled
			label="Provider/Employee Signature"
			rows="5"
			v-model="formFields.providerSignature"
		></v-textarea>

		<!-- Date selector -->
		<v-menu
			min-width="290px"
			offset-y
			transition="scale-transition"
			v-model="openProviderSignDate"
			:close-on-content-click="false"
			:nudge-right="40"
		>
			<template v-slot:activator="{ on }">
				<v-text-field
					label="Date"
					prepend-icon="event"
					readonly
					v-model="formFields.providerSignDate"
					v-on="on"
				></v-text-field>
			</template>
			<v-date-picker
				v-model="formFields.providerSignDate"
				@input="openProviderSignDate = false"
			></v-date-picker>
		</v-menu>
		<!-- End Date selector -->
		<!-- End Employee Verification Section -->

		<hr />

		<strong class="subtitle-1">
			<v-checkbox
				label="I authorize the CDDP/Brokerage/CIIS staff to ender the
		data reported on this form into eXPRS on my behalf for claims
		creation and payment."
				v-model="formFields.authorization"
			></v-checkbox>

			<v-textarea
				auto-grow
				filled
				label="Provider Initials"
				rows="1"
				v-model="formFields.providerInitials"
			></v-textarea>

			Providers submit this completed/signed form to the CDDP, Brokerage or
			CIIS Program that authorized the service delivered.
		</strong>

		<hr />
		<v-container>
			<v-row>

				<v-col>
					<v-btn color="error" class="mr-4" @click="reset">
						Reset Form
					</v-btn>
				</v-col>
				
				<v-col>
					<v-btn
						color="success"
						dark
						@click="validate"
					>
						Submit
					</v-btn>

					<v-dialog
						v-model="dialog"
						max-width="300"
					>
					<div v-if="validForm">
						<v-card>
							<v-card-title class="headline">Are you sure you want to submit the form?</v-card-title>

							<v-card-text>
								Some text talking about how this submission is final unless something is wrong
								with it.
							</v-card-text>

							<v-card-actions>
								<v-spacer></v-spacer>

								<v-btn
									color="red"
									text
									@click="dialog = false"
								>
									Cancel
								</v-btn>

								<v-btn
									color="green darken-1"
									text
									@click="sendForm"
								>
									Submit
								</v-btn>
							</v-card-actions>
						</v-card>
					</div>
					<div v-else>
						<v-card>
							<v-card-title class="headline text-danger">Your form is not valid.</v-card-title>

							<v-card-text>
								Please fix the invalid parts of the form and then retry submitting your form.
							</v-card-text>
						</v-card>
						</div>

					</v-dialog>
					
					<!--ConfirmSubmission :isValid="validForm" @click.native="validate"/-->	
				</v-col>


			</v-row>
		</v-container>
	</v-form>

<!--div v-if="submissionStatus">
	<v-card>
		<v-card-text>
			<h1 class="text-center text-success">
				Your form has been submitted!
			</h1>
		</v-card-text>
	</v-card>
</div>
-->
</template>

<script>
  import FormTable from "@/components/Timesheet/FormTable";
//	import ConfirmSubmission from "@/components/Timesheet/ConfirmSubmission";
	import axios from 'axios';
	
	//URL to post to
	const URL = '

  export default {
    name: "IDDForm",
    components: {
      FormTable,
//			ConfirmSubmission,
    },
    props: {
      // A .json file that is the parsed uploaded IDD timesheet data
      parsedFileData: {
        type: Object,
        default: null,
      },
    },
    // When this component has loaded onto the DOM, bind parsed form data
    // to each IDD Timesheet form field
    mounted: function () {
      if (this.entries !== null) {
        Object.entries(this.parsedFileData).forEach(([key, value]) => {
          if (key in this.formFields) {
            this.formFields[key] = value;
          } else {
            console.log(
              "Unrecognized parsed form field from server: " +
                `${key} - ${value}`
            );
          }
        });
      }
    },
    data: function () {
      return {
				dialog: false,
        formFields: {
          // Front side of form
          customerName: "",
          providerName: "",
          submissionDate: new Date().toISOString().substr(0, 7),
          prime: 0,
          providerNumber: 0,
          CMOrg: "",
          "SC/PA Name": "",
          service: "",
          serviceDeliveredOn: null,
          totalHours: 0,

          // Back side of form
          serviceGoal: "",
          progressNotes: "",
          employerSignDate: new Date().toISOString().substr(0, 11),
          employerSignature: "",
          providerSignDate: new Date().toISOString().substr(0, 11),
          providerSignature: "",
          authorization: false,
          providerInitials: "",
        },

        openSubmittionDate: false,
        openEmployerSignDate: false,
        openProviderSignDate: false,
				validForm: false,

        valid: true,
        nameRules: [
          (v) => !!v || "Name is required",
          (v) =>
            (v && v.length <= 25) || "Name must be less than 10 characters",
        ],
        email: "",
        emailRules: [
          (v) => !!v || "E-mail is required",
          (v) => /.+@.+\..+/.test(v) || "E-mail must be valid",
        ],
      };
    },
    methods: {
			validate() {
        //this.$refs.form.validate()
				this.dialog=true
				console.log("Validation occurs here")
				
				//If the form is valid
				if(this.valid){
					this.validForm = true
        }
      },
      reset() {
        this.$refs.form.reset();
      },
      resetValidation() {
        this.$refs.form.resetValidation();
      },
			sendForm() {
				axios.post(url, {
  				topic: 'topic',
  				logs: fakeData, // look ma, no JSON.stringify()!
				});
    },
  }
	};
</script>
