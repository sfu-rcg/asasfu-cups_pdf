# == Class cups_pdf::params
#
# This class is meant to be called from cups_pdf
# It sets variables according to platform.
#
class cups_pdf::params {
  case $::osfamily {
    'redhat': {
      case $::operatingsystem {
        CentOS: {
          case $::operatingsystemmajrelease {
            6: { $required_repos = 'epel' }
            7: { $required_repos = 'epel' }
            default: {
              $required_repos = ''
              fail("${::operatingsystem} version ${::operatingsystemmajrelease} not supported")
            }
          }
        }
        default: { 
          $required_repos = ''
          fail("${::operatingsystem} not supported")
        }
      }
    }
    default: { 
      $required_repos = ''
      fail("${::osfamily} not supported")
    }
  }
}
