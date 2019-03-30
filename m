From: andy.shevchenko@gmail.com (Andy Shevchenko)
Date: Sat, 30 Mar 2019 20:32:16 +0200
Subject: [PATCH 0/5] simple sort swap function usage improvements
In-Reply-To: <18626931553963861@sas1-b3ec53dbc12b.qloud-c.yandex.net>
References: <18626931553963861@sas1-b3ec53dbc12b.qloud-c.yandex.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAHp75Ve-VUkMA4NUfN3QxR=whfoatOuPMKddz2Gb1e9acF3vMw@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Sat, Mar 30, 2019@6:39 PM Andrey Abramov <st5pub@yandex.ru> wrote:
>
> This is the logical continuation of sort improvements by George Spelvin
> "lib/sort & lib/list_sort: faster and smaller" series
> (added to the linux-next really recently).
>
> Patches from 1 to 4 replace simple swap functions with the built-in
> (which is now much faster) and grouped by subsystem (after that only
> 3 files implement custom swap - arch/x86/kernel/unwind_orc.c,
> kernel/jump_label.c and lib/extable.c).
>
> Patch #5 replaces the int type with the size_t type of the size argument
> in the swap function.

> Andrey Abramov (5):
>   arch/arc: unwind.c: replace swap function with built-in one
>   powerpc: module_[32|64].c: replace swap function with built-in one
>   ocfs2: dir,refcounttree,xattr: replace swap functions with built-in
>     one
>   ubifs: find.c: replace swap function with built-in one
>   Lib: sort.h: replace int size with size_t size in the swap function

You have to do something about Cc list.
50 people is complete overkill. Seems as your series is a set of
independent fixes. Why not to split and Cc based on individual case?

-- 
With Best Regards,
Andy Shevchenko
