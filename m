Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF7BFA373C
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Sep 2024 10:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pX/Y90aXDCdw0ms3dH1ipRQ1GvmnTCdVJw2bQ3IOCZ4=; b=VVnDPezlHBX83u
	d7JFh0yHEnwiEbzsc9VIytkKSaXA+7UosMTk8kIyEq6jbfWdF69cwvhtMghM41O5uXgaAO413XTG1
	1GvqwHKkiA32NYQE5KGdmZNxce5Qd+cAMBoJXQS4Bo3Yhu8JUSuanRD809bBU5t6qroB5sWAqX7RB
	WhRTli2nUfxGVlAHfeSWdoFr8ZzvRXwPkQTN9AKwlDSLzKF4WSKu8maUTGnizQpsjsokupnIwEUrC
	ybG+NmkyffnxDQ9v/RWvvLxteuRVh0FJjw95cTVW8YI5knJDyrY0Nf53++/WmZ43IahdHezjMtjFe
	pLNxjEbKFpd61BeRIU+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp3ES-0000000FZcg-0nKE;
	Fri, 13 Sep 2024 10:08:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp3ED-0000000FZSj-1kUZ;
	Fri, 13 Sep 2024 10:08:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A67CBA45BAF;
	Fri, 13 Sep 2024 10:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6077CC4CEC0;
	Fri, 13 Sep 2024 10:08:25 +0000 (UTC)
Date: Fri, 13 Sep 2024 11:08:23 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Arnd Bergmann <arnd@arndb.de>, guoren <guoren@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	shuah <shuah@kernel.org>, Christoph Hellwig <hch@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	"Kirill A. Shutemov" <kirill@shutemov.name>,
	Chris Torek <chris.torek@gmail.com>,
	Linux-Arch <linux-arch@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-abi-devel@lists.sourceforge.net
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to
 47 bits
Message-ID: <ZuQPF7Gbcqzq0U6N@arm.com>
References: <9fc4746b-8e9d-4a75-b966-e0906187e6b7@app.fastmail.com>
 <CAJF2gTTVX9CFM3oRZZP3hGExwVwA_=n1Lrq_0DQKWA+-ZbOekg@mail.gmail.com>
 <f23b18c6-1856-4b59-9ba3-59809b425c81@app.fastmail.com>
 <Ztrq8PBLJ3QuFJz7@arm.com>
 <oshwto46wbbgneiayj63umllyozm3c4267rvpszqzaopwnt2l7@6mxl5vydtons>
 <ZuDoExckq21fePoe@ghost>
 <ZuHfp0_tAQhaymdy@arm.com>
 <ZuKHpFB+uWuJe2xm@ghost>
 <ZuLIPZId9aHcAY2j@arm.com>
 <ZuNaD+zAXiAulc0n@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZuNaD+zAXiAulc0n@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_030837_621074_BBD19756 
X-CRM114-Status: GOOD (  24.99  )
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

On Thu, Sep 12, 2024 at 02:15:59PM -0700, Charlie Jenkins wrote:
> On Thu, Sep 12, 2024 at 11:53:49AM +0100, Catalin Marinas wrote:
> > On Wed, Sep 11, 2024 at 11:18:12PM -0700, Charlie Jenkins wrote:
> > > Opting-in to the higher address space is reasonable. However, it is not
> > > my preference, because the purpose of this flag is to ensure that
> > > allocations do not exceed 47-bits, so it is a clearer ABI to have the
> > > applications that want this guarantee to be the ones setting the flag,
> > > rather than the applications that want the higher bits setting the flag.
> > 
> > Yes, this would be ideal. Unfortunately those applications don't know
> > they need to set a flag in order to work.
> 
> It's not a regression, the applications never worked (on platforms that
> do not have this default). The 47-bit default would allow applications
> that didn't work to start working at the cost of a non-ideal ABI. That
> doesn't seem like a reasonable tradeoff to me.  If applications want to
> run on new hardware that has different requirements, shouldn't they be
> required to update rather than expect the kernel will solve their
> problems for them?

That's a valid point but it depends on the application and how much you
want to spend updating user-space. OpenJDK is fine, if you need a JIT
you'll have to add support for that architecture anyway. But others are
arch-agnostic, you just recompile to your target. It's not an ABI
problem, more of an API one.

The x86 case (and powerpc/arm64) was different, the 47-bit worked for a
long time before expanding it. So it made a lot of sense to keep the
same default.

Anyway, the prctl() can go both ways, either expanding or limiting the
default address space. So I'd be fine with such interface.

-- 
Catalin

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
