Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E6FCD4F4D
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Sep 2024 06:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZH6id1xv8/6QrVrCiqEuU+K/xb7RpqGYv85BzEgfZ8s=; b=zkU+prh2oAsjaw
	nVl46jbQyxNryb/A7869Gks9TqVxnQKalW7490HEC6d665EpTEBKSxWsrjRbiNTkcCYnRBS3w3eeQ
	FYi/7zhBvWo3YwG35E8jebfJ7TfHj4PvKm8uk1kKOsq0b1JdGnGc1+/TbSdSSvFaNtakuiPVgduNR
	Ll2m2VUJeB+l1AY0EQiDTQzzHX13KuDrpCMJOAEAROXBb7a6Yw6ycwUtdoF0EFz1X5sVLYPjG1fEZ
	LFkyTQ5kKDGLzVVpMkzbcIlm/K7h5oiMdKY04Zx5oMbZ2oqU6wJzAR5VJRtKwh2qFgbnKf/Bq3k03
	xkoh1gfqosUAr+uzbSjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm6Ij-00000007FY3-33Tn;
	Thu, 05 Sep 2024 06:49:05 +0000
Received: from flow4-smtp.messagingengine.com ([103.168.172.139])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm6Hw-00000007FJo-2AqK;
	Thu, 05 Sep 2024 06:48:18 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailflow.phl.internal (Postfix) with ESMTP id 2A50C200312;
	Thu,  5 Sep 2024 02:48:13 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Thu, 05 Sep 2024 02:48:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1725518893; x=
	1725526093; bh=Mf2wLWEzbgEDGO9xDiUM7qVc6lrNS1Frm04RYEBk1sI=; b=Q
	8crL5ELpizMZj53aZEPPP8KupjNzGuUtN+S5Eql/8fjeevh2FEI8C/KRzBgjisY8
	ios3Pgjc7SkHZNFrwTBdbN9vLV0hQOPZ0eGAbRLWcSFDhE/k/dFK/6686hm06Qc7
	j+d1+irVVZvEWixrzNwCK0W0NFAOLfexqwJSuWjLycECHToeCwRE/1nGc1l53s4y
	bTxHKlADHmHXtzGUzzaiGYjtQhWPUZPI1/USh3xl6u1Sv+0nc2TPrbw6UIkv/TH5
	o0fe/l4uJKU0W7HYU3dmXPK5TN/niHwvbSVEfHyU6/SyMLvAiqJybTS8Vdvh4PKb
	H+eYihXIcEOzrl4xD0b/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1725518893; x=1725526093; bh=Mf2wLWEzbgEDGO9xDiUM7qVc6lrN
	S1Frm04RYEBk1sI=; b=OU81mlQLPJz3hQL5seRxaoll2jedmTxaU/rc98Aelm4E
	LAxjKKoyXT3sGMCDk5gVUo9sxMNF10KBdu8zNR469iNU+zb+tCPxEiRvZRViIIGY
	4fRFF6UlbxvVpD5zNmimnvrmkdHBLjbsEEMeFENIAWyU688aW4sL4S7nK33Ed+/W
	TyoXbq/qhCQqfRaAUgcJL4Qlr9Fj3Kdw1fErx8TN92mDg+L0IfsQjqkdjZyqKyoX
	xxZY1zHYiN3d8+EpCTErHeTz8LagFsN6v0fROg/TqD03KtfFlVXL4OQSdmSkjWEs
	7+FNGRNxSZmK+xVN+gK5oYOL0OpwypHDNQIa583pLA==
X-ME-Sender: <xms:KVTZZtmPE-thdTnuY_8p_VYbScCFsLPUpHQE1sSDWOUGpPhis5okIQ>
    <xme:KVTZZo1Rk7zksy2dploGdpr-AyeT9WYUGP1TsK2AxLpGyZ512Gxr45tn13iRPanwo
    jUygEc69YU63tyiwpI>
X-ME-Received: <xmr:KVTZZjq_WhH3u82jxZ84wXaPI17hSYcHUbnROaZ7wU0ggfeJ3nMXkfr_MNvXqfbD0Tby-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehkedguddugecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdfstddttddv
    necuhfhrohhmpedfmfhirhhilhhlucetrdcuufhhuhhtvghmohhvfdcuoehkihhrihhllh
    esshhhuhhtvghmohhvrdhnrghmvgeqnecuggftrfgrthhtvghrnhepffdvveeuteduhffh
    ffevlefhteefveevkeelveejudduvedvuddvleetudevhfeknecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirhhilhhlsehshhhuthgvmhho
    vhdrnhgrmhgvpdhnsggprhgtphhtthhopeehjedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtoheptghhrghrlhhivgesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtoheprghr
    nhgusegrrhhnuggsrdguvgdprhgtphhtthhopehrihgthhgrrhgurdhhvghnuggvrhhsoh
    hnsehlihhnrghrohdrohhrghdprhgtphhtthhopehinhhksehjuhhrrghsshhitgdrphgr
    rhhkrdhmshhurdhruhdprhgtphhtthhopehmrghtthhsthekkeesghhmrghilhdrtghomh
    dprhgtphhtthhopehvghhuphhtrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhi
    nhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehguhhorhgvnheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheptghhvghnhhhurggtrghisehkvghrnhgvlhdr
    ohhrgh
X-ME-Proxy: <xmx:KVTZZtnzzMVFQMQuTZtC752mZiRRbs6t6YcMoPbuWvOsshNuIpN2ZA>
    <xmx:KVTZZr2NqJHS-K1m6CZXX9gA76bE8gj6MA6NfpzKnkdoePcXVRrFGA>
    <xmx:KVTZZsvDPoUpWv-9vcqAuPt1ffOgwMCdy7jO9etPU_H5-IK1rvsyPg>
    <xmx:KVTZZvVQYxvPemikvBptMQf8FFNrgJR1-TyZmjrtc_-NhbXBtGvm-w>
    <xmx:LVTZZrXmQ5mCcW2zvtjGPHJiDs11N1_ZXK9wQrKvm9JMfjCFohmINZ7A>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Sep 2024 02:47:52 -0400 (EDT)
Date: Thu, 5 Sep 2024 09:47:47 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 	Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
 	Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, 	WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, 	Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 	Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>,
 	Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 	Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 	Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>,
 	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "David S. Miller" <davem@davemloft.net>,
 	Andreas Larsson <andreas@gaisler.com>,
 Thomas Gleixner <tglx@linutronix.de>, 	Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, 	Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 	Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Shuah Khan <shuah@kernel.org>, linux-arch@vger.kernel.org,
 	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org,
 	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 loongarch@lists.linux.dev, 	linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, 	linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC v2 0/4] mm: Introduce MAP_BELOW_HINT
Message-ID: <yu7um2tcxg2apoz372rmzpkrfgbb42ndvabvrsp4usb2e3bkrf@huaucjsp5vlj>
References: <20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_234816_727338_EA0F4CA7 
X-CRM114-Status: GOOD (  18.43  )
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

On Thu, Aug 29, 2024 at 12:15:57AM -0700, Charlie Jenkins wrote:
> Some applications rely on placing data in free bits addresses allocated
> by mmap. Various architectures (eg. x86, arm64, powerpc) restrict the
> address returned by mmap to be less than the 48-bit address space,
> unless the hint address uses more than 47 bits (the 48th bit is reserved
> for the kernel address space).
> 
> The riscv architecture needs a way to similarly restrict the virtual
> address space. On the riscv port of OpenJDK an error is thrown if
> attempted to run on the 57-bit address space, called sv57 [1].  golang
> has a comment that sv57 support is not complete, but there are some
> workarounds to get it to mostly work [2].
> 
> These applications work on x86 because x86 does an implicit 47-bit
> restriction of mmap() address that contain a hint address that is less
> than 48 bits.
> 
> Instead of implicitly restricting the address space on riscv (or any
> current/future architecture), a flag would allow users to opt-in to this
> behavior rather than opt-out as is done on other architectures. This is
> desirable because it is a small class of applications that do pointer
> masking.

This argument looks broken to me.

The "small class of applications" is going to be broken unless they got
patched to use your new mmap() flag. You are asking for bugs.

Consider the case when you write, compile and validate a piece of software
on machine that has <=47bit VA. The binary got shipped to customers.
Later, customer gets a new shiny machine that supports larger address
space and your previously working software is broken. Such binaries might
exist today.

It is bad idea to use >47bit VA by default. Most of software got tested on
x86 with 47bit VA.

We can consider more options to opt-in into wider address space like
personality or prctl() handle. But opt-out is no-go from what I see.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
