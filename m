Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4935AC77B73
	for <linux-snps-arc@archiver.kernel.org>; Sat,  6 May 2023 07:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HgL1RQ/FqGGwTxHQex4nlhDnuSO2fcQw+NVUrUWZF38=; b=J41wYesoh86m1H
	uxTvZ0O34OKdgrxPZWyPvpnqdxxk3Cb6OXVLJl5ocFkj+zs8FM2eN2VzBdfCpdilSA0GVrJepz0jf
	qKZ8xh2C2uUqQCIgpuLADhGMqdlCzPJdcx3p4wBInZygVfc0WCVUVFvqYDDEi+nDUj8LlxEVyNU7Q
	2JoOV9utul+km1q+dyN62gVI0YIu6q8PU+iCbbAdWJjiiBcS40GeKsWqwdTEu/Eu4w6Jbbuv46TXt
	5S915oQ22VXEQexeEtRtQOmv8rQ4HT91RIWqUO9lDMnb3xgYV3tH2mGWacbvK4aVV1on1UqlLclw4
	wxcCLXF97s45IDHT3CKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvCjY-00CpcR-0t;
	Sat, 06 May 2023 07:53:36 +0000
Received: from new1-smtp.messagingengine.com ([66.111.4.221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvCjS-00Cpaz-2y;
	Sat, 06 May 2023 07:53:32 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 8739E580382;
	Sat,  6 May 2023 03:53:26 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Sat, 06 May 2023 03:53:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1683359606; x=1683366806; bh=qirqUm7PnGWHwQwNur2abUio9msrv//9RED
	Pco6ZlX4=; b=oUIJ95rOpDfmRIzT7ndjLdYZNMy36XDlyo33IIEnHSZ33J0jADb
	s8Wl2kVkXJ9JJL3ahFR6/tUlWgUg4T+5GlAeuQgXbA623ytSHMI6w33pgrL5gPkQ
	W8F9RgVjYAsbzO0gAELiS07CjrceJMlDMNGbnMT9Ppt63zRALUtziJnVtHYJYrC3
	a3r22nW3NOQdW6Hcx+hp4tzQSpvzL4utHV+ScKAqMXRif/hqb3qf7dOQ+j3mOiYB
	/Gww6To5Kxu+ozfU/ZCYuINBO6ysg5uyjP/XCWJL1nSywHzOgGamR8pUcOoc8zW0
	PzXXzWMa17DEz49ZSDc7azQgksBHteG3XQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1683359606; x=1683366806; bh=qirqUm7PnGWHwQwNur2abUio9msrv//9RED
	Pco6ZlX4=; b=FTFVgfgd6MPCYHuvSvrDTPt1RQM4i9lYAY8vCVwWMXDobvjkv3Z
	98lyhl/R4Z82PvVH4ieQeChYq9mxrO3Tqs0Z+otZq+jWQa7lpVJmdHx3vCIv562k
	5ADJwfkwb6kvs1asZ6WGFKig2+74Ll9eG8vGoZajkWbn1RTVNMqQfOy884BWhLTb
	wyeVn3+UcWjPWKhyA06U/+/+qwSQ0waDdwo3IioSt1GthWkBHvBi5WzfTDLUwgBQ
	WNv1APC6NvhnyRkD36wa/v9PZN6oR9vyEi3DbLbtGzb4baYhlYxJ8FSQ9iQVXYTE
	oKIRXNMC90D9Vu2ER6odZWG3KS51wOQMKDA==
X-ME-Sender: <xms:cwdWZIyxfxC9bvjRyqPyh0ib1bw6Vq3YOOk7GDOHuGHr104jlhllfw>
    <xme:cwdWZMR86By_Es81Fs24nFfL6mcjYvXqEeFR5y0ciKrGphskxtRvTK7MWwtAln-3I
    9slHMOPYz1bwza1C4s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeffedguddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    tehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrf
    grthhtvghrnhepgfekueelgeeigefhudduledtkeefffejueelheelfedutedttdfgveeu
    feefieegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:cwdWZKWPJSNKGJ1BoPCjHJFB41ohvbYc5lXNMEaSpXVx65fcImDOSA>
    <xmx:cwdWZGjTC32HbA-ZJkwR9iDyfFZL5rCJIdL47Ja82EI69IRoNBcwbA>
    <xmx:cwdWZKA3HC6RuBSTtV_3Bfdw9CRHScG4KYDshiiNwwwPwz9AjH93HQ>
    <xmx:dgdWZEwIsTjJdExHIHSo4sMn188isLdlE6P98sPFv2qrASynbBpX8w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id CB166B60086; Sat,  6 May 2023 03:53:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-386-g2404815117-fm-20230425.001-g24048151
Mime-Version: 1.0
Message-Id: <b464c1e7-f185-46d1-8b15-9592fa0cfc25@app.fastmail.com>
In-Reply-To:  <CAJF2gTSRuj3-AgynXxZeXc2vGSH8Ohn5eP2hsuKi8rTzSPLhRQ@mail.gmail.com>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-10-arnd@kernel.org>
 <CAJF2gTT2VCVMJs1NvgK66uD+BhObjM2WNxf2RY7wTZsho4sjVA@mail.gmail.com>
 <f460ad77-aa76-43bb-b2bb-e3b6dbcd8b03@app.fastmail.com>
 <CAJF2gTSRuj3-AgynXxZeXc2vGSH8Ohn5eP2hsuKi8rTzSPLhRQ@mail.gmail.com>
Date: Sat, 06 May 2023 09:53:03 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: guoren <guoren@kernel.org>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Christoph Hellwig" <hch@lst.de>,
 linux-kernel@vger.kernel.org, "Vineet Gupta" <vgupta@kernel.org>,
 "Will Deacon" <will@kernel.org>, "Russell King" <linux@armlinux.org.uk>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Brian Cain" <bcain@quicinc.com>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Michal Simek" <monstr@monstr.eu>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Dinh Nguyen" <dinguyen@kernel.org>, "Stafford Horne" <shorne@gmail.com>,
 "Helge Deller" <deller@gmx.de>, "Michael Ellerman" <mpe@ellerman.id.au>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "David S . Miller" <davem@davemloft.net>,
 "Max Filippov" <jcmvbkbc@gmail.com>,
 "Robin Murphy" <robin.murphy@arm.com>, "Lad,
 Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH 09/21] riscv: dma-mapping: skip invalidation before bidirectional
 DMA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_005331_395215_822865E4 
X-CRM114-Status: GOOD (  18.61  )
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

T24gU2F0LCBNYXkgNiwgMjAyMywgYXQgMDk6MjUsIEd1byBSZW4gd3JvdGU6Cj4gT24gRnJpLCBN
YXkgNSwgMjAyMyBhdCA5OjE54oCvUE0gQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4gd3Jv
dGU6Cj4+Cj4+IFRoaXMgaXMgc29tZXRoaW5nIHdlIGNhbiBjb25zaWRlci4gVW5mb3J0dW5hdGVs
eSwgdGhpcyBpcyBzb21ldGhpbmcKPj4gdGhhdCBubyBhcmNoaXRlY3R1cmUgKGV4Y2VwdCBwYS1y
aXNjLCB3aGljaCBoYXMgb3RoZXIgcHJvYmxlbXMpCj4+IGRvZXMgYXQgdGhlIG1vbWVudCwgc28g
d2UnZCBwcm9iYWJseSBuZWVkIHRvIGhhdmUgYSBwcm9wZXIgZGViYXRlCj4+IGFib3V0IHRoaXMu
Cj4+Cj4+IFdlIGFscmVhZHkgaGF2ZSB0d28gY29uZmxpY3Rpbmcgd2F5cyB0byBoYW5kbGUgRE1B
X0ZST01fREVWSUNFLAo+PiBlaXRoZXIgaW52YWxpZGF0ZS9pbnZhbGlkYXRlLCBvciBjbGVhbi9p
bnZhbGlkYXRlLiBJIGNhbiBzZWUKPiBJIHZvdGUgdG8gaW52YWxpZGF0ZS9pbnZhbGlkYXRlLgo+
Ci4uLgo+Cj4+IHRoYXQgZmx1c2gvaW52YWxpZGF0ZSBtYXkgYmUgYSBzZW5zaWJsZSBvcHRpb24g
YXMgd2VsbCwgYnV0IEknZAo+PiB3YW50IHRvIGhhdmUgdGhhdCBkaXNjdXNzaW9uIGFmdGVyIHRo
ZSBzZXJpZXMgaXMgY29tcGxldGUsIHNvCj4+IHdlIGNhbiBjb21lIHRvIGEgZ2VuZXJpYyBzb2x1
dGlvbiB0aGF0IGhhcyB0aGUgc2FtZSBkb2N1bWVudGVkCj4+IGJlaGF2aW9yIGFjcm9zcyBhbGwg
YXJjaGl0ZWN0dXJlcy4KPiBZZXMsIEkgYWdyZWUgdG8gdW5pZnkgdGhlbSBpbnRvIGEgZ2VuZXJp
YyBzb2x1dGlvbiBmaXJzdC4gTXkgcHJvcG9zYWwKPiBjb3VsZCBiZSBhbm90aGVyIHRvcGljIGlu
IHRoZSBmdXR1cmUuCgpSaWdodCwgSSB3YXMgZXhwbGljaXRseSB0cnlpbmcgdG8gZXhjbHVkZSB0
aGF0IHF1ZXN0aW9uIGZyb20gbXkKc2VyaWVzLCBhbmQgbGVmdCBpdCBhcyBhbiBhcmNoaXRlY3R1
cmUgc3BlY2lmaWMgS2NvbmZpZyBvcHRpb24KYmFzZWQgb24gdGhlIGN1cnJlbnQgYmVoYXZpb3Iu
Cgo+PiBJbiBwYXJ0aWN1bGFyLCBpZiB3ZSBlbmQgdXAgbW92aW5nIGFybTY0IGFuZCByaXNjdiBi
YWNrIHRvIHRoZQo+PiB0cmFkaXRpb25hbCBpbnZhbGlkYXRlL2ludmFsaWRhdGUgZm9yIERNQV9G
Uk9NX0RFVklDRSBhbmQKPj4gZG9jdW1lbnQgdGhhdCBkcml2ZXIgbXVzdCBub3QgcmVseSBvbiBi
dWZmZXJzIGdldHRpbmcgY2xlYW5lZAo+IEFmdGVyIGludmFsaWRhdGlvbiwgdGhlIGNhY2hlIGxp
bmVzIGFyZSBhbHNvIGNsZWFuZWQsIHJpZ2h0PyBTbyB3aHkgZG8KPiB3ZSBuZWVkIHRvIGRvY3Vt
ZW50IGl0IGFkZGl0aW9uYWxseT8KCkkgbWVudGlvbmVkIHRoZSBkZWJhdGUgaW4gdGhlIGNvdmVy
IGxldHRlciwgdGhlIGZ1bGwgZXhwbGFuYXRpb24KaXMgYXJjaGl2ZWQgYXQKaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsLzIwMjIwNjA2MTUyMTUwLkdBMzE1NjhAd2lsbGllLXRoZS10cnVjay8K
CkluIHNob3J0LCB0aGUgcHJvYmxlbSB0aGF0IGlzIGFkZHJlc3NlZCBoZXJlIGlzIGxlYWtpbmcg
c2Vuc2l0aXZlCmtlcm5lbCBkYXRhIHRvIHVzZXIgc3BhY2Ugb3IgYSBkZXZpY2UgYXMgaW4gdGhp
cyBzZXF1ZW5jZToKCjEuIEEgRE1BIGJ1ZmZlciBpcyBhbGxvY2F0ZWQgaW4gdGhlIGtlcm5lbCBh
bmQgY29udGFpbnMgc3RhbGUgZGF0YQogICB0aGF0IGlzIG5vIGxvbmdlciBuZWVkZWQgYnV0IG11
c3Qgbm90IGJlIGV4cG9zZWQgdG8gdW50cnVzdGVkCiAgIHVzZXJzcGFjZSwgaS5lLiBlbmNyeXB0
aW9uIGtleXMgb3IgdXNlciBmaWxlIHBhZ2VzCjIuIGFsbG9jYXRvciB1c2VzIG1lbXNldCgpIHRv
IGNsZWFyIG91dCB0aGUgYnVmZmVyCjMuIGJ1ZmZlciBnZXRzIG1hcHBlZCBpbnRvIGEgZGV2aWNl
IGZvciBETUFfRlJPTV9ERVZJQ0UKNC4gd3JpdGViYWNrIGNhY2hlIGdldHMgaW52YWxpZGF0ZWQs
IHVuY292ZXJpbmcgdGhlIHNlbnNpdGl2ZQogICBkYXRhIGJ5IGRpc2NhcmRpbmcgdGhlIHplcm9z
CjUuIGRldmljZSByZXR1cm5zIGxlc3MgZGF0YSB0aGFuIGV4cGVjdGVkCjYuIGJ1ZmZlciBpcyB1
bm1hcHBlZAo3LiB3aG9sZSBidWZmZXIgaXMgbWFwcGVkIG9yIGNvcGllZCB0byB1c2VyIHNwYWNl
CgpXaWxsIGFkZGVkIGhpcyBwYXRjaCBmb3IgYXJtNjQgdG8gcHJldmVudCB0aGlzIHNjZW5hcmlv
IGJ5IHVzaW5nCidjbGVhbicgaW5zdGVhZCBvZiAnaW52YWxpZGF0ZScgaW4gc3RlcCA0LCBhbmQg
dGhlIHNhbWUgYmVoYXZpb3IKZ290IGNvcGllZCB0byByaXNjdiBidXQgbm90IG1vc3Qgb2YgdGhl
IG90aGVyIGFyY2hpdGVjdHVyZXMuClRoZSBkbWEtbWFwcGluZyBkb2N1bWVudGF0aW9uIGRvZXMg
bm90IHNheSBhbnl0aGluZyBhYm91dCB0aGlzCmNhc2UsIGFuZCBhbiBhbHRlcm5hdGl2ZSBhcHBy
b2FjaCB3b3VsZCBiZSB0byBkb2N1bWVudCB0aGF0CmRldmljZSBkcml2ZXJzIG11c3Qgd2F0Y2gg
b3V0IGZvciBzaG9ydCByZWFkcyBpbiBzdGVwIDUsIG9yIHRoYXQKa3phbGxvYygpIHNob3VsZCBj
bGVhbiB0aGUgY2FjaGUgaW4gc3RlcCAyLiBCb3RoIG9mIHRoZXNlIGNvbWUKYXQgYSBjb3N0IGFz
IHdlbGwuCgogICAgIEFybmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc25wcy1hcmMK
