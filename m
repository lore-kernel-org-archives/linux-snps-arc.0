Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E5BC79F82
	for <linux-snps-arc@archiver.kernel.org>; Tue,  8 Sep 2026 11:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ruLmqeu3VRI2BqpdOZu4xAelYsNRfPFGGcS4X2/xyyc=; b=0r+GMXJNOjKQT6
	LSthINtfafBKa+y+xUfv0wEgmBe86BsxAiTaAwHTVpq4ubPetikHdfbYr5+lniVS/5+/yC+Cq9xYk
	CoaM+jmZ6oP3ItoxJXoeK3jNVpwHCxrANcHBw/CsENg2NkCFmc0IN9nac9R88Sk0eOfzIuIkie2aK
	CyYXpXuJPTaBYeEUBwVMSbam4cALNGaqgASMt8y4MFZENYU3pHDqDEh/t8su4jxHro9no8QAj+aSx
	Dp8xxwRrS55xtCgRN/IrHheK+UPMlQTTS68w9vRhx8XtImJ/89hJ3Hk/Rg7gexkeptZsGozn9N+MM
	FTBEa/KI+qotshD9RxfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3u1k-00000008t7O-3Zgw;
	Tue, 08 Sep 2026 11:30:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3u1h-00000008t6U-3cAV;
	Tue, 08 Sep 2026 11:30:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 74F4D43C1E;
	Tue,  8 Sep 2026 11:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1CBD1F00A3A;
	Tue,  8 Sep 2026 11:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788867009;
	bh=mB8nfc2dyoUj8MneI5XtqKUJWAX+H2A9jp3sF5M1qbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BbzZ3F73x9vlPWvAcrfnuEIBJXW3qsffsRXzmqRI35CWZGCBYksgG+FZ6D4aufx7+
	 sEVq9yImHXZGqNWFVp5OCg/tUPoqmbCnXM4gOVpEztvlmpfzA1qGnFHu5hqumBWzdY
	 N5H85H7ubmL/KpLoi3BPX0MUJ8xr61MTWOAacXoR48MSTMJ0Wfiiqe1Y/y4kuLcp+l
	 khOBR7+6+n4ltCTDSLtuvWLW78S/WOu2iBGYFFag5m3jqVXrl0QqQoIKHO1R75ph5X
	 Qb1cRBjIYoRUQrLjUPvWxDGa1pvp8BiecTbRNMlM0odqliUSIGX+UuU4BPhFAXN8b9
	 dTjdPKOeABgjg==
Date: Tue, 8 Sep 2026 12:29:46 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Kiryl Shutsemau <kas@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Guo Ren <guoren@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Dinh Nguyen <dinguyen@kernel.org>, 
	Simon Schuster <schuster.simon@siemens-energy.com>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Russell King <linux@armlinux.org.uk>, 
	Vineet Gupta <vgupta@kernel.org>, Michal Simek <monstr@monstr.eu>, Chris Zankel <chris@zankel.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Arnd Bergmann <arnd@arndb.de>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-snps-arc@lists.infradead.org, linux-arch@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-alpha@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-um@lists.infradead.org, Hugh Dickins <hughd@google.com>, Qi Zheng <qi.zheng@linux.dev>
Subject: Re: [PATCH 12/12] mm: change the contract for free_pgtables(),
 update docs
Message-ID: <ap_xj3W3SjsnRBXv@gremlin>
References: <20260901-rcu-pagetable-freeing-v1-0-5456a81c8212@kernel.org>
 <20260901-rcu-pagetable-freeing-v1-12-5456a81c8212@kernel.org>
 <apbUpMDJglS99_yK@thinkstation>
 <apbfzUwBQyxe3P9R@gremlin>
 <apcH74QsR5I-DIbL@thinkstation>
 <apcJhtvnd45EkjJI@gremlin>
 <CAJuCfpH_v4YU+hsQDU_yQ4HZDf-2C6DuiJU5PGL+uVAsTwkZug@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJuCfpH_v4YU+hsQDU_yQ4HZDf-2C6DuiJU5PGL+uVAsTwkZug@mail.gmail.com>
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

T24gTW9uLCBTZXAgMDcsIDIwMjYgYXQgMDk6NTM6NDNBTSAtMDcwMCwgU3VyZW4gQmFnaGRhc2Fy
eWFuIHdyb3RlOgo+IE9uIFR1ZSwgU2VwIDEsIDIwMjYgYXQgMTA6MjXigK9BTSBMb3JlbnpvIFN0
b2FrZXMgKEFSTSkgPGxqc0BrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gPiBTbywgbWF5YmUgc29t
ZXRoaW5nIGxpa2U6Cj4gPiA+ID4KPiA+ID4gPiAgKiBOb3RlIHRoYXQgZnJlZV9wZ3RhYmxlcygp
LCB1c2VkIGFmdGVyIHVuYW1wcGluZyBkZXRhY2hlZCB2bWFzLCBvciB3aGVuCj4gPiA+ID4gICog
ZXhpdGluZyB0aGUgd2hvZWwgbW0sIGRvZXMgbm90IHRha2UgYSBwYWdlIHRhYmxlIGxvY2sgYmVm
b3JlIGZyZWVpbmcgYSBwYWdlCj4gPiA+ID4gICogdGFibGUuCj4gPiA+ID4gICoKPiA+ID4gPiAg
KiBBcyBwYWdlIHRhYmxlIGZyZWVpbmcgaXRzZWxmIGlzIFJDVS1zYWZlLCBwYWdlIHRhYmxlIHJl
YWRlcnMgY2FuIHNhZmVseSBydW4KPiA+ID4gPiAgKiBjb25jdXJyZW50bHkgd2l0aCBwYWdlIHRh
YmxlIHRlYXJkb3duLiBIb3dldmVyLCB3cml0ZXJzIGNhbm5vdCwgYXMgd2l0aG91dAo+ID4gPiA+
ICAqIGEgbG9jayBub3RoaW5nIHByZXZlbnRzIGNvbmN1cnJlbnQgdGVhcmRvd24uCj4gPiA+ID4g
ICovCj4gPiA+ID4KPiA+ID4gPiBJbnN0ZWFkPyBXaGF0IGRvIHlvdSB0aGluaz8KPiA+ID4KPiA+
ID4gcy93aG9lbC93aG9sZS8KPiA+Cj4gPiBIYWhhIHl1cCB0aGUgaW5ldml0YWJsZSB0eXBvLi4u
Cj4KPiBBbHNvIHMvdW5hbXBwaW5nL3VubWFwcGluZyBwbGVhc2UuCgpBY2sgd2lsbCBmaXggb24g
cmVzcGluISBJIGFtIHRoZSB0eXBvIG1hc3RlciA7KQoKLS0KQ2hlZXJzLCBMb3JlbnpvCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFy
YyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
