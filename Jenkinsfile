pipeline {
  agent any

  environment {
    TF_VAR_tenancy_ocid     = credentials('oci-tenancy-ocid')
    TF_VAR_user_ocid        = credentials('oci-user-ocid')
    TF_VAR_fingerprint      = credentials('oci-fingerprint')
    TF_VAR_private_key_path = credentials('oci-private-key-file')
    TF_VAR_region           = credentials('region')
    TF_VAR_compartment_ocid = credentials('oci-compartment-ocid')
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Terraform Init') {
      steps {
        dir('list-instances') {
          sh 'terraform init'
        }
      }
    }

    stage('Terraform Plan') {
      steps {
        dir('list-instances') {
          sh 'terraform plan -input=false'
        }
      }
    }
  }
}
