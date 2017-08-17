admin-openrc:
    environ.setenv:
        - name: doesnotmatter
        - value:
            OS_PROJECT_DOMAIN_NAME: default
            OS_USER_DOMAIN_NAME: default
            OS_PROJECT_NAME: admin
            OS_USERNAME: admin
            OS_PASSWORD: {{ pillar['password']['ADMIN_PASS'] }}
            OS_AUTH_URL: http://{{ pillar['infra']['controller'] }}:35357/v3
            OS_IDENTITY_API_VERSION: '3'
            OS_IMAGE_API_VERSION: '2'
