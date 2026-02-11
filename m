Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F28ECD6D6
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Feb 2026 20:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pd4DRSq+LV3LmqdF4k+t9gui5oOsmrjd5JoqeWGxooU=; b=RAhlmH3x/AnsPm
	CjRGrR8q/2A/izczRGOYj7/7Yu8oVe8V3Lt/YSg6xqLzbUqglxPwYvF2Qr/GppoEwZRaIruJqK1D7
	CXIcVWEcSHZcvmebNxUGlPeEzWyJ+yrznKMShEUGL2xVQq9Y97gvMFKBByP3afvY+Js9CAksXGIYp
	peIJeCahjmoI1ulGgGjWwSviXs0tC4VKQlc42/2psQbUu4p6hxytA8JkPspvVlXnUUvJXmeOwr76p
	i0NoFK0GuN+OhdzWZAPbl2ya9+86g4UGbjEJY5V4jQVYSkle1E8FC+VUFLvqJdnu6Lu2Xfr2T1MqU
	/4cPMSP7XrFw3BiC773Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqGbd-000000010fa-3zoJ;
	Wed, 11 Feb 2026 20:14:37 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqGba-000000010dv-19y4
	for linux-snps-arc@lists.infradead.org;
	Wed, 11 Feb 2026 20:14:36 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b885d8f4092so952148566b.2
        for <linux-snps-arc@lists.infradead.org>; Wed, 11 Feb 2026 12:14:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770840872; cv=none;
        d=google.com; s=arc-20240605;
        b=hywhmRfMJ2HU3S7CWFT5wyfzqXHzgAaBd1kupnvG2bXc+TeGCbdPIDyfXfh5orJ/kS
         p12B29NZs+qbXf1Lsq7CKCLrCJmFH1P/9APySriM90iHc6eCJ64pH125RLe3rOPmhqqO
         6CWtsTGp53vm3DiWFY9OYs5skD7Si/9vTuUUtPRy6aov3fSX7/kXBIZDqNr4IO9TkDOO
         bWZ/keUd/Vpq/BARyHKM/FhRlz/m//3iVearccyPbEW26tzTpYHwk6A933CjZo6RmQ6W
         U48HTO1Wxq+NbZIAGK09RfahPyVfIO8vU7N8RYcHKrhbOKGraAP+ZQEweHvwkWJHdw7h
         B5AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=28hr9LjidhOb4+7vDtUZiT7dYr2nuAMqMlceW5mXuOg=;
        fh=xLUCftamiIerS7BFTncWD9FBePsjrmdZIJBoPM+8yxM=;
        b=PzPzhbWyQWYkN5WdcfjtCzRq66d3Bm8CkvVftGRvmWpyGXPvDFCBXm5KwS8byNOM7D
         E8gn745j6nrRjKazR2rlbfdiErvKZjrZkq2auG1GlBmtGn/w1Eb+sM8ab9xWWGfqOIFs
         eoi0aaJTSwepf6BAiVPWQq6tTF7t3EVGi0b4Uo0eQcFy7xf7pQw2gz6buJfPKPDQwcvS
         EJYlXnt1pKKN4woDmoQUckf7qgf2hCtr9Z7fRKJ0zDaNZECp0KRTuTiAjxWdXOoXcSoZ
         0ezCf4+AYB8/WKFygE8NuBySpu85/HAXGUt3NDJSz56iiPxjHg/Ad7ebj48/iw1ZqN/N
         1crA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770840872; x=1771445672; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28hr9LjidhOb4+7vDtUZiT7dYr2nuAMqMlceW5mXuOg=;
        b=cXL7OPgzZLeP94p5p8qWFFSXO7o0jh96MfDHM6vJWTiHC7Pt3CTNoeNxfyf8R4ILs3
         02+IhsD4n6oPnNI8la1R6Kx9+GN9INgLHns/t75kDBjnyRAyMFbTM9p+Y/Cn5UQCPNX/
         Fq5bizvlixPJbXMKwYLvq91x5eZgKXsLM8VHYHxWrOgHDpWLU5IN1SfcJgIQ0yQJ7Kw6
         L9aE1KbcZ71sWEI7omRQJm/xu7BHJz05gPSPDMJRpGAJD+NADZHp35Q6U4EJInurkrIF
         qU5yi6ie58qTQwxRi45pC4n64vJH6hxEQUVgtVAfA8+eb/Hg8u+W8NK1Li0rUeKnVDxq
         hSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770840872; x=1771445672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=28hr9LjidhOb4+7vDtUZiT7dYr2nuAMqMlceW5mXuOg=;
        b=DShCkm1Q7csg3UUiPGRlsaW4PxlAj2UF7XWuV0A33fSGhz8Azqp4PwW7uR3REVR+7g
         u0Gq/zfcQ1/g04QxFtQ0wCHXF4uyTz0A9CDDlQWKocDgD9GkBG8jqireyZAtHaBF4xYi
         9mUZHK8jr60cX77vcjD/l32d0AgX6QgeGOmi8PF5s1KlxE1j0Ifw0m20rElqDRqtyAoa
         4ze2aSC5v9HYkpcCU3ORSMd75VpGou95Gz0Y0a36VROtlbeEz4u1fmJzrF5wu919Qg7S
         04qHBiACrgqj+baxkKPYt0S59GOfWDpfrllkk4AlgcPM7jVXOY59OY1nM78DUF6i4LQc
         uPXA==
X-Forwarded-Encrypted: i=1; AJvYcCXwJMnbNgmqEA+GnGE8Nv5b0WwEXtmxh+YoZ6LQaAnrpa7qdXWXlIjBRoGoaYzf9ttvVKfU8nk/9XWCaWRJAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1esOz2P5ne2rhE/v+lZkKrEPioG56OCw6TopAnjjevyD+y+YU
	26Bhb/A7vdyoYMmsl4GuzPtpqRPj8oPoTbyEywRIJxQk4JdbeRCsPpvi5uDl3VKcff/kZ/5qFyG
	UrFkM4iKU7qnPYOV9fy2xUu+uz4wJwbo=
X-Gm-Gg: AZuq6aL8woSeo/zct9+K4iAvizaI7O6wNT957eExPmSuikUtzvK2qzOnKJkXgGOdgcv
	7aPEBMEmdJdjn5Y4UYMnAodBhMvWTB7mWqb5TH4ocRcXUMSIoiJXxx5Bw61ftA6sUIor1QPY60U
	p8RYOGd9+CDHgjM3wsziHJjiio+kTDPNaxYNMUpb8kYga82WMjiUWOCTu2SnF4sYLI+RUcoGDH9
	jzVidkTDxbHF+1LNBYTroTbTmIpWCbH8o9J/7ADNLpHq5EVz2Zo8BoyudX5iaVCgOvcwA+27pzJ
	+MBZHQeZmuqxtMQ44QC2ek0yK/C6nwlTb6T7Y5gzRw==
X-Received: by 2002:a17:907:a08a:b0:b8e:64e:1ed with SMTP id
 a640c23a62f3a-b8f8f72d91emr17643566b.50.1770840871149; Wed, 11 Feb 2026
 12:14:31 -0800 (PST)
MIME-Version: 1.0
References: <20260211103141.3215197-1-rppt@kernel.org> <20260211103141.3215197-4-rppt@kernel.org>
In-Reply-To: <20260211103141.3215197-4-rppt@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 11 Feb 2026 21:14:19 +0100
X-Gm-Features: AZwV_QgdPAvH3hw0825YIt93LQPupYFvh_AV-2zMkwGhubC87cSa2iVxpdoZwag
Message-ID: <CA+=Fv5T07oBJweU3tURD4Nuh7VRWovsf0zjHtA1nDAVNmO=D2w@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arch, mm: consolidate empty_zero_page
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andreas Larsson <andreas@gaisler.com>, 
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@kernel.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, 
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>, 
	Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, Vineet Gupta <vgupta@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org, 
	x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_121434_336977_4840C7D6 
X-CRM114-Status: GOOD (  23.80  )
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

T24gV2VkLCBGZWIgMTEsIDIwMjYgYXQgMTE6MzLigK9BTSBNaWtlIFJhcG9wb3J0IDxycHB0QGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gRnJvbTogIk1pa2UgUmFwb3BvcnQgKE1pY3Jvc29mdCkiIDxy
cHB0QGtlcm5lbC5vcmc+Cj4KPiBSZWR1Y2UgMjIgZGVjbGFyYXRpb25zIG9mIGVtcHR5X3plcm9f
cGFnZSB0byAzIGFuZCAyMyBkZWNsYXJhdGlvbnMgb2YKPiBaRVJPX1BBR0UoKSB0byA0Lgo+Cj4g
RXZlcnkgYXJjaGl0ZWN0dXJlIGRlZmluZXMgZW1wdHlfemVyb19wYWdlIHRoYXQgd2F5IG9yIGFu
b3RoZXIsIGJ1dCBmb3IgdGhlCj4gbW9zdCBvZiB0aGVtIGl0IGlzIGFsd2F5cyBhIHBhZ2UgYWxp
Z25lZCBwYWdlIGluIEJTUyBhbmQgbW9zdCBkZWZpbml0aW9ucwo+IG9mIFpFUk9fUEFHRSBkbyB2
aXJ0X3RvX3BhZ2UoZW1wdHlfemVyb19wYWdlKS4KPgo+IE1vdmUgTGludXMgdmV0dGVkIHg4NiBk
ZWZpbml0aW9uIG9mIGVtcHR5X3plcm9fcGFnZSBhbmQgWkVST19QQUdFKCkgdG8gdGhlCj4gY29y
ZSBNTSBhbmQgZHJvcCB0aGVzZSBkZWZpbml0aW9ucyBpbiBhcmNoaXRlY3R1cmVzIHRoYXQgZG8g
bm90IGltcGxlbWVudAo+IGNvbG9yZWQgemVybyBwYWdlIChNSVBTIGFuZCBzMzkwKS4KPgo+IFpF
Uk9fUEFHRSgpIHJlbWFpbnMgYSBtYWNybyBiZWNhdXNlIHR1cm5pbmcgaXQgdG8gYSB3cmFwcGVy
IGZvciBhIHN0YXRpYwo+IGlubGluZSBjYXVzZXMgc2V2ZXJlIHBhaW4gaW4gaGVhZGVyIGRlcGVu
ZGVuY2llcy4KPgo+IEZvciB0aGUgbW9zdCBwYXJ0IHRoZSBjaGFuZ2UgaXMgbWVjaGFuaWNhbCwg
d2l0aCB0aGVzZSBiZWluZyBub3Rld29ydGh5Ogo+Cj4gKiBhbHBoYTogYWxpYXNlZCBlbXB0eV96
ZXJvX3BhZ2Ugd2l0aCBaRVJPX1BHRSB0aGF0IHdhcyBhbHNvIHVzZWQgZm9yIGJvb3QKPiAgIHBh
cmFtZXRlcnMuIFN3aXRjaGluZyB0byBhIGdlbmVyaWMgZW1wdHlfemVyb19wYWdlIHJlbW92ZXMg
dGhlIGFsaWFzaW5nCj4gICBhbmQga2VlcHMgWkVST19QR0UgZm9yIGJvb3QgcGFyYW1ldGVycyBv
bmx5Cj4gKiBhcm02NDogdXNlcyBfX3BhX3N5bWJvbCgpIGluIFpFUk9fUEFHRSgpIHNvIHRoYXQg
ZGVmaW5pdGlvbiBvZgo+ICAgWkVST19QQUdFKCkgaXMga2VwdCBpbnRhY3QuCj4gKiBtNjhrL3Bh
cmlzYy91bTogYWxsb2NhdGVkIGVtcHR5X3plcm9fcGFnZSBmcm9tIG1lbWJsb2NrLAo+ICAgYWx0
aG91Z2ggdGhleSBkbyBub3Qgc3VwcG9ydCB6ZXJvIHBhZ2UgY29sb3JpbmcgYW5kIGhhdmluZyBp
dCBpbiBCU1MKPiAgIHdpbGwgd29yayBmaW5lLgo+ICogc3BhcmM2NCBjYW4gaGF2ZSBlbXB0eV96
ZXJvX3BhZ2UgaW4gQlNTIHJhdGhlciBhbGxvY2F0ZSBpdCwgYnV0IGl0Cj4gICBjYW4ndCB1c2Ug
dmlydF90b19wYWdlKCkgZm9yIEJTUy4gS2VlcCBpdCdzIGRlZmluaXRpb24gb2YgWkVST19QQUdF
KCkKPiAgIGJ1dCBpbnN0ZWFkIG9mIGFsbG9jYXRpbmcgaXQsIG1ha2UgbWVtX21hcF96ZXJvIHBv
aW50IHRvCj4gICBlbXB0eV96ZXJvX3BhZ2UuCj4gKiBzaDogdXNlZCBlbXB0eV96ZXJvX3BhZ2Ug
Zm9yIGJvb3QgcGFyYW1ldGVycyBhdCB0aGUgdmVyeSBlYXJseSBib290Lgo+ICAgUmVuYW1lIHRo
ZSBwYXJhbWV0ZXJzIHBhZ2UgdG8gYm9vdF9wYXJhbXNfcGFnZSBhbmQgbGV0IHNoIHVzZSB0aGUg
Z2VuZXJpYwo+ICAgZW1wdHlfemVyb19wYWdlLgo+ICogaGV4YWdvbjogaGFkIGFuIGFtdXNpbmcg
Y29tbWVudCBhYm91dCBlbXB0eV96ZXJvX3BhZ2UKPgo+ICAgICAgICAgLyogQSBoYW5keSB0aGlu
ZyB0byBoYXZlIGlmIG9uZSBoYXMgdGhlIFJBTS4gRGVjbGFyZWQgaW4gaGVhZC5TICovCj4KPiAg
IHRoYXQgdW5mb3J0dW5hdGVseSBoYWQgdG8gZ28gOikKPgo+IEFja2VkLWJ5OiBIZWxnZSBEZWxs
ZXIgPGRlbGxlckBnbXguZGU+ICAgIyBwYXJpc2MKPiBUZXN0ZWQtYnk6IEhlbGdlIERlbGxlciA8
ZGVsbGVyQGdteC5kZT4gICMgcGFyaXNjCj4gUmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVyb3kg
KENTIEdST1VQKSA8Y2hsZXJveUBrZXJuZWwub3JnPgo+IEFja2VkLWJ5OiBEYXZlIEhhbnNlbiA8
ZGF2ZS5oYW5zZW5AbGludXguaW50ZWwuY29tPgo+IEFja2VkLWJ5OiBDYXRhbGluIE1hcmluYXMg
PGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tPgo+IFNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQg
KE1pY3Jvc29mdCkgPHJwcHRAa2VybmVsLm9yZz4KPiAtLS0KPiAgYXJjaC9hbHBoYS9pbmNsdWRl
L2FzbS9wZ3RhYmxlLmggICAgICAgICAgfCAgNiAtLS0tLS0KCj4gZGlmZiAtLWdpdCBhL2FyY2gv
YWxwaGEvaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9hbHBoYS9pbmNsdWRlL2FzbS9wZ3Rh
YmxlLmgKPiBpbmRleCA5MGU3YTk1MzkxMDIuLjEyYTNjNWY4ZWNlOCAxMDA2NDQKPiAtLS0gYS9h
cmNoL2FscGhhL2luY2x1ZGUvYXNtL3BndGFibGUuaAo+ICsrKyBiL2FyY2gvYWxwaGEvaW5jbHVk
ZS9hc20vcGd0YWJsZS5oCj4gQEAgLTEyNSwxMiArMTI1LDYgQEAgc3RydWN0IHZtX2FyZWFfc3Ry
dWN0Owo+ICAgKi8KPiAgI2RlZmluZSBwZ3Byb3Rfbm9uY2FjaGVkKHByb3QpIChwcm90KQo+Cj4g
LS8qCj4gLSAqIFpFUk9fUEFHRSBpcyBhIGdsb2JhbCBzaGFyZWQgcGFnZSB0aGF0IGlzIGFsd2F5
cyB6ZXJvOiAgdXNlZAo+IC0gKiBmb3IgemVyby1tYXBwZWQgbWVtb3J5IGFyZWFzIGV0Yy4uCj4g
LSAqLwo+IC0jZGVmaW5lIFpFUk9fUEFHRSh2YWRkcikgICAgICAgKHZpcnRfdG9fcGFnZShaRVJP
X1BHRSkpCj4gLQo+ICAvKgo+ICAgKiBPbiBjZXJ0YWluIHBsYXRmb3JtcyB3aG9zZSBwaHlzaWNh
bCBhZGRyZXNzIHNwYWNlIGNhbiBvdmVybGFwIEtTRUcsCj4gICAqIG5hbWVseSBFVjYgYW5kIGFi
b3ZlLCB3ZSBtdXN0IHJlLXR3aWRkbGUgdGhlIHBoeXNhZGRyIHRvIHJlc3RvcmUgdGhlCgpUaGlz
IGxvb2tzIGdvb2QgZnJvbSBhbiBBbHBoYSBwZXJzcGVjdGl2ZQoKQWNrZWQtYnk6IE1hZ251cyBM
aW5kaG9sbSA8bGlubWFnN0BnbWFpbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25w
cy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
