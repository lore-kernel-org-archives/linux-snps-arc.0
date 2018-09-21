From: ross.burton@intel.com (Burton, Ross)
Date: Fri, 21 Sep 2018 11:55:50 +0100
Subject: [OE-core] [PATCH v2 8/9] binutils: Fix Glibc building for ARC
In-Reply-To: <20180920204232.10583-9-abrodkin@synopsys.com>
References: <20180920204232.10583-1-abrodkin@synopsys.com>
 <20180920204232.10583-9-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAJTo0Lb9HFXbXVNDHoMyx8eF06kd0710B0+KXuiCAocvGLevfw@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

I don't like accumulating pending patches for something as key as
binutils, are these actually working their way upstream now?

Ross
On Thu, 20 Sep 2018 at 21:44, Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:
>
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> ---
>
> Changes v1 -> v2:
>
>  * Added upstream status
>
>  meta/recipes-devtools/binutils/binutils-2.31.inc   |   4 +
>  ...location-where-GOT-information-is-collect.patch | 201 +++++++++++++++++++++
>  ...bustness.-Return-FALSE-in-case-of-NULL-po.patch |  38 ++++
>  ...lobal-symbol-is-not-an-indirect-or-warnin.patch |  46 +++++
>  ...tion-was-still-being-generated-when-symbo.patch |  40 ++++
>  5 files changed, 329 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0018-Refactored-location-where-GOT-information-is-collect.patch
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0019-Improved-robustness.-Return-FALSE-in-case-of-NULL-po.patch
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0020-Make-sure-global-symbol-is-not-an-indirect-or-warnin.patch
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0021-PLT-information-was-still-being-generated-when-symbo.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.31.inc b/meta/recipes-devtools/binutils/binutils-2.31.inc
> index bc951d73e4..76add0fe4b 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.31.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.31.inc
> @@ -37,6 +37,10 @@ SRC_URI = "\
>       file://0015-sync-with-OE-libtool-changes.patch \
>       file://0016-add-i386pep-emulation-for-x86_64.patch \
>       file://0017-improve-check-for-input-file-matching-output-file.patch \
> +     file://0018-Refactored-location-where-GOT-information-is-collect.patch \
> +     file://0019-Improved-robustness.-Return-FALSE-in-case-of-NULL-po.patch \
> +     file://0020-Make-sure-global-symbol-is-not-an-indirect-or-warnin.patch \
> +     file://0021-PLT-information-was-still-being-generated-when-symbo.patch \
>  "
>  S  = "${WORKDIR}/git"
>
> diff --git a/meta/recipes-devtools/binutils/binutils/0018-Refactored-location-where-GOT-information-is-collect.patch b/meta/recipes-devtools/binutils/binutils/0018-Refactored-location-where-GOT-information-is-collect.patch
> new file mode 100644
> index 0000000000..d41339a9a6
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0018-Refactored-location-where-GOT-information-is-collect.patch
> @@ -0,0 +1,201 @@
> +From d930affa2d475d1cc6792f1e6d56bef3d6c617db Mon Sep 17 00:00:00 2001
> +From: Cupertino Miranda <cmiranda at synopsys.com>
> +Date: Fri, 2 Mar 2018 17:16:21 +0100
> +Subject: [PATCH] Refactored location where GOT information is collected.
> +
> +Change location where GOT information is collected for ARC target, avoiding
> +posible use conflicts of the previous .got field in the symbols hash_entry.
> +
> +bfd/
> +2018-03-01  Cupertino Miranda  <cmiranda at synopsys.com>
> +
> +       * arc-got.h (get_got_entry_list_for_symbol): Changed.
> +       * ef32-arc.c (struct elf_arc_link_hash_entry): Moved and changed.
> +       (elf_arc_link_hash_newfunc): Changed.
> +       (arc_elf_link_hash_table_create): Removed old initializations.
> +       (elf_arc_relocate_section, elf_arc_finish_dynamic_symbol): Changed.
> +
> +Signed-off-by: Cupertino Miranda <cmiranda at synopsys.com>
> +Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> +[Romain: rebase on top of 2.31]
> +Signed-off-by: Romain Naour <romain.naour at gmail.com>
> +
> +Upstream-Status: Pending
> +---
> + bfd/arc-got.h   |  6 +++--
> + bfd/elf32-arc.c | 77 +++++++++++++++++++++++++++++++--------------------------
> + 2 files changed, 46 insertions(+), 37 deletions(-)
> +
> +diff --git a/bfd/arc-got.h b/bfd/arc-got.h
> +index a86061bcb38..81ce88fe21a 100644
> +--- a/bfd/arc-got.h
> ++++ b/bfd/arc-got.h
> +@@ -156,9 +156,11 @@ get_got_entry_list_for_symbol (bfd *abfd,
> +                              unsigned long r_symndx,
> +                              struct elf_link_hash_entry *h)
> + {
> +-  if (h != NULL)
> ++  struct elf_arc_link_hash_entry *h1 =
> ++    ((struct elf_arc_link_hash_entry *) h);
> ++  if (h1 != NULL)
> +     {
> +-      return &h->got.glist;
> ++      return &h1->got_ents;
> +     }
> +   else
> +     {
> +diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
> +index a48ef0ca15f..ab84de43815 100644
> +--- a/bfd/elf32-arc.c
> ++++ b/bfd/elf32-arc.c
> +@@ -160,6 +160,18 @@ struct arc_relocation_data
> +   const char *    symbol_name;
> + };
> +
> ++/* ARC ELF linker hash entry.  */
> ++struct elf_arc_link_hash_entry
> ++{
> ++  struct elf_link_hash_entry root;
> ++
> ++  /* Track dynamic relocs copied for this symbol.  */
> ++  struct elf_dyn_relocs *dyn_relocs;
> ++
> ++  struct got_entry *got_ents;
> ++};
> ++
> ++
> + /* Should be included at this location due to static declarations
> +    defined before this point.  */
> + #include "arc-got.h"
> +@@ -281,15 +293,6 @@ struct arc_reloc_map
> +   unsigned char                   elf_reloc_val;
> + };
> +
> +-/* ARC ELF linker hash entry.  */
> +-struct elf_arc_link_hash_entry
> +-{
> +-  struct elf_link_hash_entry root;
> +-
> +-  /* Track dynamic relocs copied for this symbol.  */
> +-  struct elf_dyn_relocs *dyn_relocs;
> +-};
> +-
> + /* ARC ELF linker hash table.  */
> + struct elf_arc_link_hash_table
> + {
> +@@ -301,28 +304,28 @@ elf_arc_link_hash_newfunc (struct bfd_hash_entry *entry,
> +                          struct bfd_hash_table *table,
> +                          const char *string)
> + {
> ++  struct elf_arc_link_hash_entry * ret =
> ++    (struct elf_arc_link_hash_entry *) entry;
> ++
> +   /* Allocate the structure if it has not already been allocated by a
> +      subclass.  */
> +-  if (entry == NULL)
> +-    {
> +-      entry = (struct bfd_hash_entry *)
> +-        bfd_hash_allocate (table,
> +-                           sizeof (struct elf_arc_link_hash_entry));
> +-      if (entry == NULL)
> +-      return entry;
> +-    }
> ++  if (ret == NULL)
> ++    ret = (struct elf_arc_link_hash_entry *)
> ++      bfd_hash_allocate (table, sizeof (struct elf_arc_link_hash_entry));
> ++  if (ret == NULL)
> ++    return (struct bfd_hash_entry *) ret;
> +
> +   /* Call the allocation method of the superclass.  */
> +-  entry = _bfd_elf_link_hash_newfunc (entry, table, string);
> +-  if (entry != NULL)
> ++  ret = ((struct elf_arc_link_hash_entry *)
> ++       _bfd_elf_link_hash_newfunc ((struct bfd_hash_entry *) ret,
> ++                                   table, string));
> ++  if (ret != NULL)
> +     {
> +-      struct elf_arc_link_hash_entry *eh;
> +-
> +-      eh = (struct elf_arc_link_hash_entry *) entry;
> +-      eh->dyn_relocs = NULL;
> ++      ret->dyn_relocs = NULL;
> ++      ret->got_ents = NULL;
> +     }
> +
> +-  return entry;
> ++  return (struct bfd_hash_entry *) ret;
> + }
> +
> + /* Destroy an ARC ELF linker hash table.  */
> +@@ -352,11 +355,6 @@ arc_elf_link_hash_table_create (bfd *abfd)
> +       return NULL;
> +     }
> +
> +-  ret->elf.init_got_refcount.refcount = 0;
> +-  ret->elf.init_got_refcount.glist = NULL;
> +-  ret->elf.init_got_offset.offset = 0;
> +-  ret->elf.init_got_offset.glist = NULL;
> +-
> +   ret->elf.root.hash_table_free = elf_arc_link_hash_table_free;
> +
> +   return &ret->elf.root;
> +@@ -1615,10 +1613,14 @@ elf_arc_relocate_section (bfd *                          output_bfd,
> +         while (h->root.type == bfd_link_hash_indirect
> +                || h->root.type == bfd_link_hash_warning)
> +         {
> +-          struct elf_link_hash_entry *h_old = h;
> ++          struct elf_arc_link_hash_entry *ah_old =
> ++            (struct elf_arc_link_hash_entry *) h;
> +           h = (struct elf_link_hash_entry *) h->root.u.i.link;
> +-          if (h->got.glist == 0 && h_old->got.glist != h->got.glist)
> +-            h->got.glist = h_old->got.glist;
> ++          struct elf_arc_link_hash_entry *ah =
> ++            (struct elf_arc_link_hash_entry *) h;
> ++
> ++          if (ah->got_ents == 0 && ah_old->got_ents != ah->got_ents)
> ++            ah->got_ents = ah_old->got_ents;
> +         }
> +
> +         /* TODO: Need to validate what was the intention.  */
> +@@ -1636,6 +1638,8 @@ elf_arc_relocate_section (bfd *                    output_bfd,
> +
> +             if (is_reloc_for_GOT (howto) && !bfd_link_pic (info))
> +               {
> ++                struct elf_arc_link_hash_entry *ah =
> ++                  (struct elf_arc_link_hash_entry *) h;
> +                 /* TODO: Change it to use arc_do_relocation with
> +                   ARC_32 reloc.  Try to use ADD_RELA macro.  */
> +                 bfd_vma relocation =
> +@@ -1645,8 +1649,8 @@ elf_arc_relocate_section (bfd *                    output_bfd,
> +                        + reloc_data.sym_section->output_section->vma)
> +                     : 0);
> +
> +-                BFD_ASSERT (h->got.glist);
> +-                bfd_vma got_offset = h->got.glist->offset;
> ++                BFD_ASSERT (ah->got_ents);
> ++                bfd_vma got_offset = ah->got_ents->offset;
> +                 bfd_put_32 (output_bfd, relocation,
> +                             htab->sgot->contents + got_offset);
> +               }
> +@@ -1958,6 +1962,7 @@ elf_arc_check_relocs (bfd *                       abfd,
> +       else /* Global one.  */
> +       h = sym_hashes[r_symndx - symtab_hdr->sh_info];
> +
> ++
> +       switch (r_type)
> +       {
> +         case R_ARC_32:
> +@@ -2404,7 +2409,9 @@ elf_arc_finish_dynamic_symbol (bfd * output_bfd,
> +      create respective dynamic relocs.  */
> +   /* TODO: Make function to get list and not access the list directly.  */
> +   /* TODO: Move function to relocate_section create this relocs eagerly.  */
> +-  create_got_dynrelocs_for_got_info (&h->got.glist,
> ++  struct elf_arc_link_hash_entry *ah =
> ++    (struct elf_arc_link_hash_entry *) h;
> ++  create_got_dynrelocs_for_got_info (&ah->got_ents,
> +                                    output_bfd,
> +                                    info,
> +                                    h);
> +--
> +2.14.4
> +
> diff --git a/meta/recipes-devtools/binutils/binutils/0019-Improved-robustness.-Return-FALSE-in-case-of-NULL-po.patch b/meta/recipes-devtools/binutils/binutils/0019-Improved-robustness.-Return-FALSE-in-case-of-NULL-po.patch
> new file mode 100644
> index 0000000000..6a58ee06ac
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0019-Improved-robustness.-Return-FALSE-in-case-of-NULL-po.patch
> @@ -0,0 +1,38 @@
> +From 955176bd999fe80c5b937ab8786665079e35c387 Mon Sep 17 00:00:00 2001
> +From: Cupertino Miranda <cmiranda at synopsys.com>
> +Date: Fri, 2 Mar 2018 17:33:48 +0100
> +Subject: [PATCH] Improved robustness. Return FALSE in case of NULL pointer.
> +
> +bfd/
> +2018-03-01  Cupertino Miranda <cmiranda at synopsys.com>
> +
> +       * elf32-arc.c (elf_arc_finish_dynamic_symbol) Return FALSE in case
> +       arc_htab is NULL.
> +
> +Signed-off-by: Cupertino Miranda <cmiranda at synopsys.com>
> +Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> +[Romain: rebase on top of 2.31]
> +Signed-off-by: Romain Naour <romain.naour at gmail.com>
> +
> +Upstream-Status: Pending
> +---
> + bfd/elf32-arc.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
> +index ab84de43815..33fc72cff6e 100644
> +--- a/bfd/elf32-arc.c
> ++++ b/bfd/elf32-arc.c
> +@@ -2420,6 +2420,9 @@ elf_arc_finish_dynamic_symbol (bfd * output_bfd,
> +     {
> +       struct elf_arc_link_hash_table *arc_htab = elf_arc_hash_table (info);
> +
> ++      if(arc_htab == NULL)
> ++      return FALSE;
> ++
> +       if (h->dynindx == -1
> +         || (h->root.type != bfd_link_hash_defined
> +             && h->root.type != bfd_link_hash_defweak)
> +--
> +2.14.4
> +
> diff --git a/meta/recipes-devtools/binutils/binutils/0020-Make-sure-global-symbol-is-not-an-indirect-or-warnin.patch b/meta/recipes-devtools/binutils/binutils/0020-Make-sure-global-symbol-is-not-an-indirect-or-warnin.patch
> new file mode 100644
> index 0000000000..01e42c03bb
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0020-Make-sure-global-symbol-is-not-an-indirect-or-warnin.patch
> @@ -0,0 +1,46 @@
> +From 9d09ce14b4eef2b56f24660fd69a44acd45128b2 Mon Sep 17 00:00:00 2001
> +From: Cupertino Miranda <cmiranda at synopsys.com>
> +Date: Fri, 2 Mar 2018 17:38:14 +0100
> +Subject: [PATCH] Make sure global symbol is not an indirect or warning.
> +
> +Problem identified in the context of glibc with latest upstream binutils.
> +Dynamic symbol space was being reserved but, no actual information for the
> +symbol was being set. Data for the symbol was kept initialized with -1.
> +No easy test case was possible to be created.
> +
> +bfd/
> +2018-03-01  Cupertino Miranda <cmiranda at synopsys.com>
> +
> +       * elf32-arc.c (elf_arc_check_relocs): Changed.
> +
> +Signed-off-by: Cupertino Miranda <cmiranda at synopsys.com>
> +Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> +[Romain: rebase on top of 2.31]
> +Signed-off-by: Romain Naour <romain.naour at gmail.com>
> +
> +Upstream-Status: Pending
> +---
> + bfd/elf32-arc.c | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
> +index 33fc72cff6e..9b72c5b4f4f 100644
> +--- a/bfd/elf32-arc.c
> ++++ b/bfd/elf32-arc.c
> +@@ -1960,7 +1960,12 @@ elf_arc_check_relocs (bfd *                      abfd,
> +       if (r_symndx < symtab_hdr->sh_info) /* Is a local symbol.  */
> +       h = NULL;
> +       else /* Global one.  */
> +-      h = sym_hashes[r_symndx - symtab_hdr->sh_info];
> ++      {
> ++        h = sym_hashes[r_symndx - symtab_hdr->sh_info];
> ++        while (h->root.type == bfd_link_hash_indirect
> ++               || h->root.type == bfd_link_hash_warning)
> ++          h = (struct elf_link_hash_entry *) h->root.u.i.link;
> ++      }
> +
> +
> +       switch (r_type)
> +--
> +2.14.4
> +
> diff --git a/meta/recipes-devtools/binutils/binutils/0021-PLT-information-was-still-being-generated-when-symbo.patch b/meta/recipes-devtools/binutils/binutils/0021-PLT-information-was-still-being-generated-when-symbo.patch
> new file mode 100644
> index 0000000000..9e942399c0
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0021-PLT-information-was-still-being-generated-when-symbo.patch
> @@ -0,0 +1,40 @@
> +From e4861c68067cb2166b4c2bb9c052abeb6ad9aaa1 Mon Sep 17 00:00:00 2001
> +From: Cupertino Miranda <cmiranda at synopsys.com>
> +Date: Fri, 2 Mar 2018 17:44:29 +0100
> +Subject: [PATCH] PLT information was still being generated when symbol was
> + forced_local.
> +
> +A change upstream reveiled this issue, triggering an assert when linking glibc.
> +
> +bfd/
> +2018-03-01  Cupertino Miranda <cmiranda at synopsys.com>
> +
> +       * elf32-arc.c (elf_arc_check_relocs): Changed.
> +
> +Signed-off-by: Cupertino Miranda <cmiranda at synopsys.com>
> +Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> +[Romain: rebase on top of 2.31]
> +Signed-off-by: Romain Naour <romain.naour at gmail.com>
> +
> +Upstream-Status: Pending
> +---
> + bfd/elf32-arc.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
> +index 9b72c5b4f4f..b40b463d34d 100644
> +--- a/bfd/elf32-arc.c
> ++++ b/bfd/elf32-arc.c
> +@@ -2041,7 +2041,8 @@ elf_arc_check_relocs (bfd *                       abfd,
> +         if (h == NULL)
> +           continue;
> +         else
> +-          h->needs_plt = 1;
> ++          if(h->forced_local == 0)
> ++            h->needs_plt = 1;
> +       }
> +
> +       /* Add info to the symbol got_entry_list.  */
> +--
> +2.14.4
> +
> --
> 2.16.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core at lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
