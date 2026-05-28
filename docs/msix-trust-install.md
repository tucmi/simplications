# Windows MSIX Trust Install (Internal Testing)

This guide is for internal testers using releases signed with the project self-signed certificate.

## When to use this

Use these steps if Windows blocks the installer with a trust or SmartScreen warning.

## Steps (GUI)

1. Download both release assets:
   - `simplications-<version>-windows-release.msix`
   - `msix-signing.cer`
2. Open `msix-signing.cer`.
3. Select Install Certificate.
4. Choose Current User (or Local Machine if required by your policy).
5. Choose Place all certificates in the following store.
6. Browse and select Trusted People.
7. Complete the wizard.
8. Run the `.msix` installer again.

## Optional PowerShell import

Run PowerShell as your user:

```powershell
Import-Certificate -FilePath .\msix-signing.cer -CertStoreLocation Cert:\CurrentUser\TrustedPeople
```

## Notes

- This process is only for internal testing.
- For public releases without trust prompts, use a certificate issued by a trusted code-signing CA.
