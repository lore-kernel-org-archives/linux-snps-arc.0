Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B926E81BD8
	for <linux-snps-arc@archiver.kernel.org>; Mon,  9 Feb 2026 15:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u0ELWfv5ISjJ4yYqgNmAaI6B8RLFHZhQLOlCE6b53Lw=; b=Waq5Cx5cMFiugd
	XCn2Z/g3YnXVrySojsLvFGBg7kvP0oX4WQszkYDGCO0xhO8LhiRvHUq1n/rduEEfN4nheUHALYKF2
	XxW7Fp5r7dHGExomApFQQjIBYVa3fkq2adZTrMXcUPO3NIL4ADulMV7BAlNTes5jOQKwELFWPT6As
	OR5usyg7WnHGj82ozvZeM07m99BsTUlMGFB1WzpDLns7QESthOifpVEk9YupdBPGHDa9wOVblC4lr
	VXx+r4m6UZnVWPx+NKd/8nPceRTyNM2gM/PFQYhVc/nTJYEtMtUPP8hSY4N3pmSiHVW1ZXk9vr3H7
	IkRqk0hAYczTh9e802fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpSsd-0000000FaBx-2Gjk;
	Mon, 09 Feb 2026 15:08:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpSsZ-0000000FaBK-2bDR;
	Mon, 09 Feb 2026 15:08:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 95B326011E;
	Mon,  9 Feb 2026 15:08:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4E07C116C6;
	Mon,  9 Feb 2026 15:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770649726;
	bh=74hxAhJyO+2eTcl7giR1QDsEixnocOOTI/KCVXUN3oc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hHysNRIgE1EgualKU6aPczQKYfw+TDjGY4OatYFD3fS7TYkGD7WEmgWx3geZeHrfv
	 F1zDDpuaU0nwUv7Ae8xi1oXRUWF9pjvFzqRkh1G83qeRNbE6qwS1sk3FHaw39jYn+r
	 Nk+PQE+5SnWvARHfBa8QAWdgNoL3wy2mlksHsr/SXlqVp8ketneSvd/HphO2nVp9tE
	 BCsZzIL9BLqAHeIK57meLHZ0odqx+OpNBfkHnj8PRzutvNrHUWbq5+TlKgLRN2HHQv
	 huO+HUqNPVA5lqDphasR6vnb5IXL4MN7aVd4+kWDg4t8O5NV52bIkpeW9MtEreTJuG
	 K04aIwqR6xaWg==
Message-ID: <0f15b363-a5e5-4a58-89b0-13b5112772b0@kernel.org>
Date: Mon, 9 Feb 2026 16:08:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] mm: rename my_zero_pfn() to zero_pfn()
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>,
 Brian Cain <bcain@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>,
 Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Johannes Berg <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>,
 Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>,
 Vineet Gupta <vgupta@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 linux-mm@kvack.org, x86@kernel.org
References: <20260209144058.2092871-1-rppt@kernel.org>
 <20260209144058.2092871-3-rppt@kernel.org>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260209144058.2092871-3-rppt@kernel.org>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

CgpMZSAwOS8wMi8yMDI2IMOgIDE1OjQwLCBNaWtlIFJhcG9wb3J0IGEgw6ljcml0wqA6Cj4gRnJv
bTogIk1pa2UgUmFwb3BvcnQgKE1pY3Jvc29mdCkiIDxycHB0QGtlcm5lbC5vcmc+Cj4gCj4gbXlf
emVyb19wZm4oKSBpcyBhIHNpbGx5IG5hbWUuCj4gCj4gUmVuYW1lIHplcm9fcGZuIHZhcmlhYmxl
IHRvIHplcm9fcGFnZV9wZm4gYW5kIG15X3plcm9fcGZuKCkgZnVuY3Rpb24gdG8KPiB6ZXJvX3Bm
bigpLgo+IAo+IFdoaWxlIG9uIGl0LCBtb3ZlIGV4dGVybiBkZWNsYXJhdGlvbnMgb2YgemVyb19w
YWdlX3BmbiBvdXRzaWRlIHRoZQo+IGZ1bmN0aW9ucyB0aGF0IHVzZSBpdCBhbmQgYWRkIGEgY29t
bWVudCBhYm91dCB3aGF0IFpFUk9fUEFHRSBpcy4KCkkgZ3Vlc3MgdGhlIGlkZWEgb2YgdGhlIGV4
dGVybiBkZWNsYXJhdGlvbiBiZWluZyBpbnNpZGUgaXRzIG9ubHkgCmV4dGVybmFsIHVzZXJzIHdh
cyB0byBlbnN1cmUgbm9ib2R5IHdvdWxkIHN0YXJ0IHVzaW5nIGl0IGRpcmVjdGx5LCBoZW5jZSAK
YnlwYXNzaW5nIHRoZSBvdmVybG9hZGFibGUgaGVscGVycy4KClNob3VsZCB3ZSBhdCBsZWFzdCBj
YWxsIHRoZSB2YXJpYWJsZSBfX3plcm9fcGFnZV9wZm4gaW5zdGVhZCBpbiBvcmRlciB0byAKd2Fy
biBwZW9wbGUgdGhhdCB1c2luZyBpdCBkaXJlY3RseSByZXF1aXJlcyBjYXJlID8KCkNocmlzdG9w
aGUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMt
YXJjCg==
