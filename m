Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B3CCF07A9
	for <linux-snps-arc@archiver.kernel.org>; Thu, 10 Oct 2024 05:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zwXQiyxFpO7p965YFp8FJO70nK/UWxRAVqi9nORJ1wY=; b=CdY5bQgztEYpA/
	aI2PB329WCMGe+G62SdMrZETyCxVrOfi/dP/gvchaVZQBwvQaF9tryVBteiv+dxX2xDuxIcXBJ7UE
	N/P4+hYn/UWniUFmYBGUxCKFV6GV7ElNwQV6W5p7p2mbQDKvJ+UIW1HOt0/ejxmlrBX0nLmdHc+00
	i2jOLCvfee2gv+qxGCsGeNdaqsv1Ng0ZQl40klODIsvZX/RjJDf9/iyLD7KEgpmbwR1t0iXZKpvCc
	OEdH4ZFW/hoH+f1LXDfBlyK/lPXdrLoTH2JzJZNnU9vmP9CPK2f1nRSxQ9wKJW4YhnAA3+lH4zhWJ
	gp9bqsEWYmOIGzWexEmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sym1c-0000000BbVg-455J;
	Thu, 10 Oct 2024 05:47:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sym1Z-0000000BbTl-3PkR;
	Thu, 10 Oct 2024 05:47:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 729BE5C5406;
	Thu, 10 Oct 2024 05:47:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941A0C4CECC;
	Thu, 10 Oct 2024 05:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728539264;
	bh=OTuy4VqE5rZSLBEA0/Pnb2zLZJiAXIMvgimloV5JAr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e1wK0sqCj1hFSMccCG8VnSk9aTxpzFJTrYzsRT9VXVEEoRS3hraEZu619qHthJzSx
	 DynBiJLcPJQRbA9J0lLh6ATNk3FB4/xFOM4dXnLEGXWPkSrxd0XcoTxriiWODdioLD
	 1sWIJTn6uT4ZOaW12OrRLOdpildKc5e58UW0/bc2P0yDusD5bq7Iwbf8r4b7hIX5Iy
	 XccbgL+BkzqR13hBcI+eIsGnGBFTEruC5c+E0zapz7RRHpVu6gMKoZHI6cwfi2IRZM
	 bP+nlVliXD/Sq3TcOU7AO/E8ZEwKb501SlYT1dTNQaVEK/mrQ9FtlySueDuymdFkFN
	 xybmhUi0XMlmg==
Date: Thu, 10 Oct 2024 08:43:56 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Song Liu <song@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v5 4/8] module: prepare to handle ROX allocations for text
Message-ID: <ZwdpnPKKQGF5DtSv@kernel.org>
References: <20241009180816.83591-1-rppt@kernel.org>
 <20241009180816.83591-5-rppt@kernel.org>
 <CAPhsuW66etfdU3Fvk0KsELXcgWD6_TkBFjJ-BTHQu5OejDsP2w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPhsuW66etfdU3Fvk0KsELXcgWD6_TkBFjJ-BTHQu5OejDsP2w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_224745_946664_0DF79C5B 
X-CRM114-Status: GOOD (  14.32  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBPY3QgMDksIDIwMjQgYXQgMDM6MjM6NDBQTSAtMDcwMCwgU29uZyBMaXUgd3JvdGU6
Cj4gT24gV2VkLCBPY3QgOSwgMjAyNCBhdCAxMToxMOKAr0FNIE1pa2UgUmFwb3BvcnQgPHJwcHRA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gWy4uLl0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4
L21vZHVsZS5oIGIvaW5jbHVkZS9saW51eC9tb2R1bGUuaAo+ID4gaW5kZXggODhlY2M1ZTlmNTIz
Li43MDM5ZjYwOWM2ZWYgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L21vZHVsZS5oCj4g
PiArKysgYi9pbmNsdWRlL2xpbnV4L21vZHVsZS5oCj4gPiBAQCAtMzY3LDYgKzM2Nyw4IEBAIGVu
dW0gbW9kX21lbV90eXBlIHsKPiA+Cj4gPiAgc3RydWN0IG1vZHVsZV9tZW1vcnkgewo+ID4gICAg
ICAgICB2b2lkICpiYXNlOwo+ID4gKyAgICAgICB2b2lkICpyd19jb3B5Owo+ID4gKyAgICAgICBi
b29sIGlzX3JveDsKPiA+ICAgICAgICAgdW5zaWduZWQgaW50IHNpemU7Cj4gCj4gRG8gd2UgcmVh
bGx5IG5lZWQgdG8gaG9sZCB0aGUgcndfY29weSBhbGwgdGhlIHRpbWU/IAoKV2UgaG9sZCBpdCBv
bmx5IGR1cmluZyBtb2R1bGUgaW5pdGlhbGl6YXRpb24sIGl0J3MgZnJlZWQgaW4KcG9zdF9yZWxv
Y2F0aW9uLgoKPiBUaGFua3MsCj4gU29uZwo+IAo+IFsuLi5dCgotLSAKU2luY2VyZWx5IHlvdXJz
LApNaWtlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1z
bnBzLWFyYwo=
