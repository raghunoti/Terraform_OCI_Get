pipeline {
  agent any

  environment {
    TF_VAR_tenancy_ocid     = credentials('tenancy_ocid')
    TF_VAR_user_ocid        = credentials('user_ocid')
    TF_VAR_fingerprint      = credentials('fingerprint')
    TF_VAR_private_key_path = credentials('private_key')
    TF_VAR_region           = credentials('region')
    TF_VAR_compartment_ocid = credentials('compartment_ocid')
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
