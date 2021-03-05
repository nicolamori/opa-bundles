package http.base.authz
import input

allow {
  input.account == "minioadmin"
}

# Make members of IAM groud s3admins the admins
allow {
  grp := input.claims.groups
  grp[_] == "admins"
  input.claims.iss == data.roles.permissions.issuer
}