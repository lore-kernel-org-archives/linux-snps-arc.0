From: luto@kernel.org (Andy Lutomirski)
Date: Thu, 8 Nov 2018 22:06:13 -0800
Subject: [PATCH 00/13] Prepare for PTRACE_GET_SYSCALL_INFO
In-Reply-To: <20181109031303.GA20906@altlinux.org>
References: <20181107042751.3b519062@akathisia>
 <CALCETrV1v-DPRfDRwiH=xn29bxWxiHdZtAH1nw=dsmDtnT0YGQ@mail.gmail.com>
 <20181109031303.GA20906@altlinux.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CALCETrUMnBxZ=-EWf5TJY9kqMA9Sy=mtk7OyS0tHub1+DREM=w@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Thu, Nov 8, 2018@7:13 PM Dmitry V. Levin <ldv@altlinux.org> wrote:
>
> syscall_get_arch() is required to be implemented on all architectures
> that use tracehook_report_syscall_entry() in order to extend
> the generic ptrace API with PTRACE_GET_SYSCALL_INFO request.

Nice!

I'm pretty sure you have vastly more changelog than code here :)

--Andy
