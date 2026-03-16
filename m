Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E93FB5E88
	for <linux-snps-arc@archiver.kernel.org>; Mon, 16 Mar 2026 23:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lN5EVlNLO7lCs5vee+cKom72fHhYebHZP+y53MR0H5Q=; b=zhuWI7/rL6+KJk
	rRE7Jk6dayebI3qC5b7bm1lx+XXSL3b9EQtIRN0tg00o34xm3ZXhZdQwoUE7bqdNZK0HhstqIxHHd
	ayLdK9TdVLm5pv8WGyYl1Hj3SxEU/tYgf+CiZtzbZCf6IJnC3neM5vuqev3W6/sQs0YY4vgEA4dU8
	219GGuGN4wIz86EZw0O75IDMCHBSF4L2iHEaczUr0ctBRRMEcpFwvDlc56cZDcGmfvGqIZzR3hDG8
	iPRPi5YP7KKKhEe8kJgLso+smrArF4JcYiy5QbOmRB/Twd5JFvetrM3WMsxHxf/bZOF4s6eADXD1a
	srKXwmvQZLJvzv4GOcfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2HHM-0000000541r-47Lb;
	Mon, 16 Mar 2026 23:23:21 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2HHK-0000000540N-03FU
	for linux-snps-arc@lists.infradead.org;
	Mon, 16 Mar 2026 23:23:19 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2b062069f80so5537145ad.0
        for <linux-snps-arc@lists.infradead.org>; Mon, 16 Mar 2026 16:23:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773703397; cv=none;
        d=google.com; s=arc-20240605;
        b=I3L0e/GFbZIti98WcNTCBSAPH+LFxX1TgitiUSVe+qd+ImoAxuWS4Y+iASqFr97+j3
         LrhndvkDemB1MY/hEaw+DG6QIUmfoQGtX3oMuPW54g+PUokgKAMlkvipDxVglxPy9o+S
         RjTBPGD37u3RWDeRnOPBpLX4H304QMMSo7b/NyXqz6TAQ09WOi1KBzPIBeABVgp8NpLx
         gwsTYObj9wYN1+on+nohcEVdHnYlqVd2QB42u+OovKC4pwZC9ZSLzxWEKU1yrMaJ9ZsR
         CX9HTivDSSOW7a9CPNhlc17ZL+BEH5e+f4jp3ebQXDasKwh9xzi0xHcz9xNVMW0yVEJ0
         9Xsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OjoL/xI+JfK24mJlLYQ/qQdhvwGI+GcsV2kW/9vszrY=;
        fh=MRxmOV2CnnWno8QZvL+lA3b2WpwmzyrPY7F1grNr0Zs=;
        b=lrPit+1eH1p+axPZ9p7YDJz0xm1JXe9p9MEJL1TeVuftATSsOGPrylklSWl4/XLH3A
         sR40qsPhsjB8UIGZo6uYoQ2ttiuWvWK6CdlXY2QyzIwK2Kc2pdfWhHHjpfZmUIJeJZMH
         nyYM/s4EPEFjhJXKLprt+dzFWrem97hp6mGfr9zSBaw/NY1LgweApMYILLQsGkE6JRKV
         nQZix/lLiDcAb/9QosOQGUpayknw9HfSu77CAyGCZiRlqpgOksnVeEZyFosqBmbQGRsd
         pauYpScVDvB2YYMdcuQzaKPubP80kLl4yxP1zoteTmYAWPcn1rXsruWfPjfrRT33MDZS
         pbQA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1773703397; x=1774308197; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjoL/xI+JfK24mJlLYQ/qQdhvwGI+GcsV2kW/9vszrY=;
        b=THQi8+z35wtW8rgc0hAG9hngTK2oy7gzealSIHO7WB4Ki3bjx9HXjsxpNQzdFCcf4R
         3chqkb665Bphs+j7T4ELDtRHw++9HOHQ7G9jvRu4CXudfBPFj9f5oKJl/n6EaoRF40lV
         AQ8JbyQPcxZr3dFfk/iD1mR+M7eZU0oldB1P/kgjn8e+IqCsjvH1/8r4GISAWrcyVCBH
         zbE5BWXKCyddiNiYbiBd1HXeSTcEyQ3qorJaJpOekglAREL4pSnVY5/NPSNQ9imWjCxM
         ByVe+W2dUuRiyvhFh/Rd+cpxxFnlk50ADITKjLQx0TvVOC3fU4sRZvW/kgG2uKakZFQy
         f8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773703397; x=1774308197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OjoL/xI+JfK24mJlLYQ/qQdhvwGI+GcsV2kW/9vszrY=;
        b=OI4DVD0Ozze9jalfpyagw3fXh9o5CaT8Rx4XxmXNm8CaAhY6H0pie6tAw3zAsOgI9y
         pbHz2DISOBcJFyLXBVmjIoq5PLXhnzRO7C2+sCw0kHVlio8RFRr0F7BwT75nPRDXNP+Q
         FMUfmX9NMEvNpQfbNZL/uiJJx8CA7VkuwhDK/gdiB1Iu/JSvXlXbk/TezAw8t60ucRQV
         4MSBeL8Cm9ToRarDUZA7mgEPSN1mJQe+8D3hEADEEZXb38KtJJf4IfIRlNQ3WHEND5nq
         Z3IKB1WPfrRv0zo/xFT1s79+EdJIEDkcvPckzf/F9diO6N9Q4dP3gxM0hgMEKSof0ddM
         OcQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWU/TDdElswZNtwWTFrLHDci/XsWVV17h3/apIJglGZ1PcSbwUt9IJS9nj+XZfR2XQ6yYK3212WiIpX0zNXIg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyyp9W8rgRSbU0HPInG2Wo+t4RZ1jP+ECOGPwBwNGfeulES6w+n
	YG9qQjmPqTIZRc11DEEiLwCjwgs49qtsW67Hyp4ZjxLJhoEpg7jiyhCgx/OeUHsnmtr2iqoZk4B
	rWvc/cuvjVr1IFOwyWy75izLUozX1ss2Z12mKY3u7
X-Gm-Gg: ATEYQzzb5WfPzHEwpYDVqwHcEUGjVvwyyJSXWMXT6aUPHrTqHMrFXVqCtgwJsX5whMt
	r9H6pLVPAelaF9JYaOxp1uswS8WTj77OXVduLikWlMFPyZ7twuMBbCafuPIt56LtZl2dWLhRf/R
	InxNgJAPhibEZttKEtr0n1k2XUtND91ARpgWN7vUhsKp65dXjrNrosqM3qN08IH9WFOOyUinPep
	65Edh0qjcvhUaGel8jZuNNDSw/lq5zbGTbffAoGHbSRWYUTToxBLx/ryzaJ1OaU4CyXBIBHShpz
	B0PoDoX0XnRDwPkUOg==
X-Received: by 2002:a17:902:ea06:b0:2b0:5c3f:c0d8 with SMTP id
 d9443c01a7336-2b05c3fc4damr40223235ad.47.1773703396327; Mon, 16 Mar 2026
 16:23:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773665966.git.ljs@kernel.org> <063af0422d99bee0195589aa63f8f44edaf409fa.1773665966.git.ljs@kernel.org>
In-Reply-To: <063af0422d99bee0195589aa63f8f44edaf409fa.1773665966.git.ljs@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 16 Mar 2026 19:23:04 -0400
X-Gm-Features: AaiRm50DdYFqfixz3H6HRwMmLfdf5osoLUZfr0b1blDqz3IzGNPvd_xOI_ajOas
Message-ID: <CAHC9VhR2T8ujtfvz-HgkgSFByptTLmhbCYS+scY53aYg=sgfqw@mail.gmail.com>
Subject: Re: [PATCH v2 17/23] mm: convert do_brk_flags() to use vma_flags_t
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Kees Cook <kees@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Xu Xin <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Michal Hocko <mhocko@suse.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, selinux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_162318_465866_3FC66B0B 
X-CRM114-Status: GOOD (  26.71  )
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

T24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgOTowOeKAr0FNIExvcmVuem8gU3RvYWtlcyAoT3JhY2xl
KSA8bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSW4gb3JkZXIgdG8gYmUgYWJsZSB0byBkbyB0
aGlzLCB3ZSBuZWVkIHRvIGNoYW5nZSBWTV9EQVRBX0RFRkFVTFRfRkxBR1MgYW5kCj4gZnJpZW5k
cyBhbmQgdXBkYXRlIHRoZSBhcmNoaXRlY3R1cmUtc3BlY2lmaWMgZGVmaW5pdGlvbnMgYWxzby4K
Pgo+IFdlIHRoZW4gaGF2ZSB0byB1cGRhdGUgc29tZSBLU00gbG9naWMgdG8gaGFuZGxlIFZNQSBm
bGFncywgYW5kIGludHJvZHVjZQo+IFZNQV9TVEFDS19GTEFHUyB0byBkZWZpbmUgdGhlIHZtYV9m
bGFnc190IGVxdWl2YWxlbnQgb2YgVk1fU1RBQ0tfRkxBR1MuCj4KPiBXZSBhbHNvIGludHJvZHVj
ZSB0d28gaGVscGVyIGZ1bmN0aW9ucyBmb3IgdXNlIGR1cmluZyB0aGUgdGltZSB3ZSBhcmUKPiBj
b252ZXJ0aW5nIGxlZ2FjeSBmbGFncyB0byB2bWFfZmxhZ3NfdCB2YWx1ZXMgLSB2bWFfZmxhZ3Nf
dG9fbGVnYWN5KCkgYW5kCj4gbGVnYWN5X3RvX3ZtYV9mbGFncygpLgo+Cj4gVGhpcyBlbmFibGVz
IHVzIHRvIGl0ZXJhdGl2ZWx5IG1ha2UgY2hhbmdlcyB0byBicmVhayB0aGVzZSBjaGFuZ2VzIHVw
IGludG8KPiBzZXBhcmF0ZSBwYXJ0cy4KPgo+IFdlIHVzZSB0aGVzZSBleHBsaWNpdGx5IGhlcmUg
dG8ga2VlcCBWTV9TVEFDS19GTEFHUyBhcm91bmQgZm9yIGNlcnRhaW4KPiB1c2VycyB3aGljaCBu
ZWVkIHRvIG1haW50YWluIHRoZSBsZWdhY3kgdm1fZmxhZ3NfdCB2YWx1ZXMgZm9yIHRoZSB0aW1l
Cj4gYmVpbmcuCj4KPiBXZSBhcmUgbm8gbG9uZ2VyIGFibGUgdG8gcmVseSBvbiB0aGUgc2ltcGxl
IFZNX3h4eCBiZWluZyBzZXQgdG8gemVybyBpZiB0aGUKPiBmZWF0dXJlIGlzIG5vdCBlbmFibGVk
LCBzbyBpbiB0aGUgY2FzZSBvZiBWTV9EUk9QUEFCTEUgd2UgaW50cm9kdWNlCj4gVk1BX0RST1BQ
QUJMRSBhcyB0aGUgdm1hX2ZsYWdzX3QgZXF1aXZhbGVudCwgd2hpY2ggaXMgc2V0IHRvCj4gRU1Q
VFlfVk1BX0ZMQUdTIGlmIHRoZSBkcm9wcGFibGUgZmxhZyBpcyBub3QgYXZhaWxhYmxlLgo+Cj4g
V2hpbGUgd2UncmUgaGVyZSwgd2UgbWFrZSB0aGUgZGVzY3JpcHRpb24gb2YgZG9fYnJrX2ZsYWdz
KCkgaW50byBhIGtkb2MKPiBjb21tZW50LCBhcyBpdCBhbG1vc3Qgd2FzIGFscmVhZHkuCj4KPiBX
ZSB1c2Ugdm1hX2ZsYWdzX3RvX2xlZ2FjeSgpIHRvIG5vdCBuZWVkIHRvIHVwZGF0ZSB0aGUgdm1f
Z2V0X3BhZ2VfcHJvdCgpCj4gbG9naWMgYXMgdGhpcyB0aW1lLgo+Cj4gTm90ZSB0aGF0IGluIGNy
ZWF0ZV9pbml0X3N0YWNrX3ZtYSgpIHdlIGhhdmUgdG8gcmVwbGFjZSB0aGUgQlVJTERfQlVHX09O
KCkKPiB3aXRoIGEgVk1fV0FSTl9PTl9PTkNFKCkgYXMgdGhlIHRlc3RlZCB2YWx1ZXMgYXJlIG5v
IGxvbmdlciBidWlsZCB0aW1lCj4gYXZhaWxhYmxlLgo+Cj4gV2UgYWxzbyB1cGRhdGUgbXByb3Rl
Y3RfZml4dXAoKSB0byB1c2UgVk1BIGZsYWdzIHdoZXJlIHBvc3NpYmxlLCB0aG91Z2ggd2UKPiBo
YXZlIHRvIGxpdmUgd2l0aCBhIGxpdHRsZSBkdXBsaWNhdGlvbiBiZXR3ZWVuIHZtX2ZsYWdzX3Qg
YW5kIHZtYV9mbGFnc190Cj4gdmFsdWVzIGZvciB0aGUgdGltZSBiZWluZyB1bnRpbCBmdXJ0aGVy
IGNvbnZlcnNpb25zIGFyZSBtYWRlLgo+Cj4gRmluYWxseSwgd2UgdXBkYXRlIHRoZSBWTUEgdGVz
dHMgdG8gcmVmbGVjdCB0aGVzZSBjaGFuZ2VzLgo+Cj4gU2lnbmVkLW9mZi1ieTogTG9yZW56byBT
dG9ha2VzIChPcmFjbGUpIDxsanNAa2VybmVsLm9yZz4KPiAtLS0KPiAgYXJjaC9hcmMvaW5jbHVk
ZS9hc20vcGFnZS5oICAgICAgICB8ICAyICstCj4gIGFyY2gvYXJtL2luY2x1ZGUvYXNtL3BhZ2Uu
aCAgICAgICAgfCAgMiArLQo+ICBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL3BhZ2UuaCAgICAgIHwg
IDMgKy0KPiAgYXJjaC9oZXhhZ29uL2luY2x1ZGUvYXNtL3BhZ2UuaCAgICB8ICAyICstCj4gIGFy
Y2gvbG9vbmdhcmNoL2luY2x1ZGUvYXNtL3BhZ2UuaCAgfCAgMiArLQo+ICBhcmNoL21pcHMvaW5j
bHVkZS9hc20vcGFnZS5oICAgICAgIHwgIDIgKy0KPiAgYXJjaC9uaW9zMi9pbmNsdWRlL2FzbS9w
YWdlLmggICAgICB8ICAyICstCj4gIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wYWdlLmggICAg
fCAgNCArLS0KPiAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BhZ2VfMzIuaCB8ICAyICstCj4g
IGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wYWdlXzY0LmggfCAxMiArKysrLS0tLQo+ICBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3BhZ2UuaCAgICAgIHwgIDIgKy0KPiAgYXJjaC9zMzkwL2luY2x1
ZGUvYXNtL3BhZ2UuaCAgICAgICB8ICAyICstCj4gIGFyY2gveDg2L2luY2x1ZGUvYXNtL3BhZ2Vf
dHlwZXMuaCAgfCAgMiArLQo+ICBhcmNoL3g4Ni91bS9hc20vdm0tZmxhZ3MuaCAgICAgICAgIHwg
IDQgKy0tCj4gIGluY2x1ZGUvbGludXgva3NtLmggICAgICAgICAgICAgICAgfCAxMCArKystLS0t
Cj4gIGluY2x1ZGUvbGludXgvbW0uaCAgICAgICAgICAgICAgICAgfCA0NyArKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0KPiAgbW0vaW50ZXJuYWwuaCAgICAgICAgICAgICAgICAgICAgICB8
ICAzICsrCj4gIG1tL2tzbS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA0MyArKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0KPiAgbW0vbW1hcC5jICAgICAgICAgICAgICAgICAgICAgICAg
ICB8IDEzICsrKysrLS0tLQo+ICBtbS9tcHJvdGVjdC5jICAgICAgICAgICAgICAgICAgICAgIHwg
NDYgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KPiAgbW0vbXJlbWFwLmMgICAgICAgICAg
ICAgICAgICAgICAgICB8ICA2ICsrLS0KPiAgbW0vdm1hLmMgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8IDM0ICsrKysrKysrKysrLS0tLS0tLS0tLQo+ICBtbS92bWEuaCAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgMTQgKysrKysrKy0tCj4gIG1tL3ZtYV9leGVjLmMgICAgICAgICAgICAg
ICAgICAgICAgfCAgNSArKy0tCj4gIHNlY3VyaXR5L3NlbGludXgvaG9va3MuYyAgICAgICAgICAg
fCAgNCArKy0KPiAgdG9vbHMvdGVzdGluZy92bWEvaW5jbHVkZS9jdXN0b20uaCB8ICAzIC0tCj4g
IHRvb2xzL3Rlc3Rpbmcvdm1hL2luY2x1ZGUvZHVwLmggICAgfCA0MiArKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLQo+ICB0b29scy90ZXN0aW5nL3ZtYS9pbmNsdWRlL3N0dWJzLmggIHwgIDkgKysr
LS0tCj4gIHRvb2xzL3Rlc3Rpbmcvdm1hL3Rlc3RzL21lcmdlLmMgICAgfCAgMyArLQo+ICAyOSBm
aWxlcyBjaGFuZ2VkLCAxODYgaW5zZXJ0aW9ucygrKSwgMTM5IGRlbGV0aW9ucygtKQoKTm90IHRo
YXQgdGhlIFNFTGludXggY2hhbmdlcyBhcmUgcmVhbGx5IGFsbCB0aGF0IHNpZ25pZmljYW50LCBi
dXQgdGhleQpsb29rIGZpbmUgdG8gbWUuCgpBY2tlZC1ieTogUGF1bCBNb29yZSA8cGF1bEBwYXVs
LW1vb3JlLmNvbT4gKFNFTGludXgpCgotLSAKcGF1bC1tb29yZS5jb20KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcg
bGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
