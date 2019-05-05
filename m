From: alexei.starovoitov@gmail.com (Alexei Starovoitov)
Date: Sun, 5 May 2019 00:05:06 -0700
Subject: [PATCH v2] tools/bpf: fix perf build error with uClibc (seen on
 ARC)
In-Reply-To: <CAH3MdRWkiFSRA+PRo53_Syx9OBmyj2U_ebap-9iBR8L7xW9UVw@mail.gmail.com>
References: <CAH3MdRVkUFfwKkgT-pi-RLBpcEf6n0bAwWZOu-=7+qctPTCpkw@mail.gmail.com>
 <1556812610-27957-1-git-send-email-vgupta@synopsys.com>
 <CAH3MdRWkiFSRA+PRo53_Syx9OBmyj2U_ebap-9iBR8L7xW9UVw@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAADnVQKOR7NJ=zDLndJpTnVjnkjr1UrtWG_2vwgJK3QcCAADcA@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Thu, May 2, 2019@1:20 PM Y Song <ys114321@gmail.com> wrote:
>
> On Thu, May 2, 2019@8:57 AM Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
> >
> > When build perf for ARC recently, there was a build failure due to lack
> > of __NR_bpf.
> >
> > | Auto-detecting system features:
> > |
> > | ...                     get_cpuid: [ OFF ]
> > | ...                           bpf: [ on  ]
> > |
> > | #  error __NR_bpf not defined. libbpf does not support your arch.
> >     ^~~~~
> > | bpf.c: In function 'sys_bpf':
> > | bpf.c:66:17: error: '__NR_bpf' undeclared (first use in this function)
> > |  return syscall(__NR_bpf, cmd, attr, size);
> > |                 ^~~~~~~~
> > |                 sys_bpf
> >
> > Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
>
> Acked-by: Yonghong Song <yhs at fb.com>

Applied. Thanks
