Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0583C02187
	for <linux-snps-arc@archiver.kernel.org>; Thu, 16 Jan 2025 13:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ixlMfsLG+JnpIii8pBvbU66tqCNoVSMjXYeDWUnI3lk=; b=tGqMw179ZdMHVq
	MJrwaoa+fnBZFBzYtw8LtbTg2OjS9AFQz6mkOeXFetutYDRYg3AVY8a/AkNsL6fcUNVcbHyzl2K7h
	dX1+UFVu20yvoan+MuS7dc7hKaG3osvOTl9No5LWxNJzbh7264EQ0m4GEugmMqnzPkcNK7ZB8lWXt
	8x/Qr8O5gMu5toQknaiPbFFIpQtqamcsA+Y1DkppnJ2exb8TNc71vlUfL7yVdbn4txTUT0Fgxo209
	xyos+iKHXUAn++XxLD0rVijndFMMeYTyKMzQp4IelbgMr5MeKPHQJf63WFON8xiklyihcpT6ykU+j
	jh/UqIUciMMbhQLOQMfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYPpq-0000000F095-1Pk7;
	Thu, 16 Jan 2025 13:22:58 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYPpo-0000000F07D-0Ibg
	for linux-snps-arc@lists.infradead.org;
	Thu, 16 Jan 2025 13:22:57 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-467abce2ef9so221531cf.0
        for <linux-snps-arc@lists.infradead.org>; Thu, 16 Jan 2025 05:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737033774; x=1737638574; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SixtGEHyx0Ll20sNHrYW42AzL6XqkNRKNahYOvra4Ow=;
        b=dEULxFU0bHb/mwmLcgqpU5UKtHWenHmeItXulH9VHkw8OM6S/WFLE6G/AjhPEFYXyT
         +y5oe2gz2LKcnhBm/ErIw2gJBl8V5jr7IqxSchEtTzB5fxDaNMchFlJoz+N45FVroD29
         jgZIXZASNDqcP21xj72yYjeUweaXjNo9QGNzdOstT159hZnagupqXVCXsfQiPADkxoQK
         cuAKRlTnxvMYAf+O+wjTPyAfukSZxWwywtAq8ydZcSdJbYVOoCvJow13lJCAMtsK/3q7
         nYKFJeyCpG2wssVfNIgNXywhxQeD+KRau7IaliHLJqgeGCeoP8C5vu3wnPc0ozgvPMai
         +Ntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737033774; x=1737638574;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SixtGEHyx0Ll20sNHrYW42AzL6XqkNRKNahYOvra4Ow=;
        b=T2ogX2CE2/3KeFntDNGXY1nHi2yx0pQ3FoRV/Se9SCE2/601Vqt/EZqP8X+02RN+IV
         6qntXH4QPAy78Ik815PgMZibaaIJhlBYoRBPdHoVu2KhdeiqFJNfPKz/Lk7855y/YMjU
         TefL9eG+HL6wNCnfBH5eIfKeMBQ3PumgR1cklCrJUeE2c6/v7CoyZFwIzUNSmMYvEHJc
         PcnxWwFKi8pcsGbJPAOLyterueySV3lmP2WmiSXNE8Jp9JcIfa8/RiC4yAwrN7jLuXuE
         q/lUoSEf9381kCV2BUqsrFeWeMdmY/I8ZD4yC1N4sdtC8ebVeZPNFkrAJPwnRVzOXdTD
         w/ng==
X-Forwarded-Encrypted: i=1; AJvYcCVF9nDnv/qqBxYf6fRzPpBWOiPP58w4aWPIobRTk3LmBFotdSvrLCtoh+43G33nrIS7SUPMFtsJjWswmh3mlQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxbA8zx+QCHk7g33CWjh0/6hQrEeedJXXYZ70kSMjjhzrgofviy
	QsfiXzPfBCTbyjywqyvK+MfcsqpBLbnJ5OPOPEMzv6Tt0keOeJ3O4m8Vrh/OO69eFoiLIaZXAAd
	WXbwmrOMP0vigjdmC5rs3hm47S70jEGkxU5dF
X-Gm-Gg: ASbGncurRou8kiJRsMErMdWuh2KJEFfPv3/2mL1r95TGCjYiaTfFLwpl7T2+Ya4b8yu
	qegLk/NLTu7c1JblaaRhjBBlPi2AQcF1zy9SHTR9G/te4dpNyKzTWYg2nNRPvKsF9IYA=
X-Google-Smtp-Source: AGHT+IGgdmm3+dKyYphBOJrkDF9RqCEL6Tsx6LZHIZIcfENKNOrXYM9LEzERENIX0F6hf0/LX3P/eN8RFihp6QDk6j4=
X-Received: by 2002:ac8:5f11:0:b0:466:7a06:2d03 with SMTP id
 d75a77b69052e-46e0545796amr2768561cf.1.1737033773706; Thu, 16 Jan 2025
 05:22:53 -0800 (PST)
MIME-Version: 1.0
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
 <20250110-asi-rfc-v2-v2-1-8419288bc805@google.com> <20250116001858.GDZ4hQctZe_PFvJ0AJ@fat_crate.local>
 <20250116102747.GAZ4jfI9HG3K-PW7nf@fat_crate.local>
In-Reply-To: <20250116102747.GAZ4jfI9HG3K-PW7nf@fat_crate.local>
From: Brendan Jackman <jackmanb@google.com>
Date: Thu, 16 Jan 2025 14:22:42 +0100
X-Gm-Features: AbW1kvbCtSg9vNMeYe9Cs6fkL4An-kckhSPmCiLhYkfVvSqDDbiTwg4NAXTmVUM
Message-ID: <CA+i-1C1sXC1tbo9ytuex0eBD3gUbQwnNP8rvOhCv=JV+oSHo1g@mail.gmail.com>
Subject: Re: [PATCH RFC v2 01/29] mm: asi: Make some utility functions noinstr compatible
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Chris Zankel <chris@zankel.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mike Rapoport <rppt@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	kvm@vger.kernel.org, linux-efi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_052256_130982_4F77819F 
X-CRM114-Status: GOOD (  30.40  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu, 16 Jan 2025 at 01:21, Borislav Petkov <bp@alien8.de> wrote:
> > Unfortunately Thomas pointed out this will prevent the function from
> > being inlined at call sites in .text.
> >
> > So far I haven't been able[1] to find a formulation that lets us :
> > 1. avoid calls from .noinstr.text -> .text,
> > 2. while also letting the compiler freely decide what to inline.
> >
> > 1 is a functional requirement so here I'm just giving up on 2. Existing
> > callsites of this code are just forced inline. For the incoming code
> > that needs to call it from noinstr, they will be out-of-line calls.
>
> I'm not sure some of that belongs in the commit message - if you want to have
> it in the submission, you should put it under the --- line below, right above
> the diffstat.

Sure. I'm actually not even sure that for a [PATCH]-quality thing this
cross-cutting commit even makes sense - once we've decided on the
general way to solve this problem, perhaps the changes should just be
part of the commit that needs them?

It feels messy to have a patch that "does multiple things", but on the
other hand it might be annoying to review a patch that says "make a
load of random changes across the kernel, which are needed at various
points in various upcoming patches, trust me".

Do you have any opinion on that?

(BTW, since a comment you made on another series (can't find it on
Lore...), I've changed my writing style to avoid stuff like this in
comments & commit messages in general, but this text all predates
that. I'll do my best to sort all that stuff out before I send
anything as a [PATCH].)

On Thu, 16 Jan 2025 at 11:29, Borislav Petkov <bp@alien8.de> wrote:
>
> On Thu, Jan 16, 2025 at 01:18:58AM +0100, Borislav Petkov wrote:
> > Long story short, lemme try to poke around tomorrow to try to figure out what
> > actually happens. It could be caused by the part of Rik's patches and this one
> > inlining things. We'll see...
>
> Looks transient... The very similar guest boots fine on another machine. Let's
> watch this...

Oh, I didn't notice your update until now. But yeah I also couldn't
reproduce it on a Sapphire Rapids machine and on QEMU with this patch
applied on top of tip/master (37bc915c6ad0f).

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
