Return-Path: <SRS0=i8W8=3R=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA41AC33CB3
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Jan 2020 05:48:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1B212467E
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Jan 2020 05:48:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IDm2+ZxV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lca.pw header.i=@lca.pw header.b="Hma1sjKp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1B212467E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	Date:Subject:Mime-Version:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FK6/nNX5g3r5sQhWSi17vIJMCiuqVxsd7MZwBiT8qHc=; b=IDm2+ZxVe8FNpa
	z9h6Py1CvlmuQzfoTyPNbdboroeRNVp3vI6pR8ZsG+a1/nvL62rdujaXeDgDsyG9WBHyhJeeTU+Pi
	0ULjy4o1Nb46Tkoh4CTk/JMMfO/hUER6+N1bCEhPUTEEj8mw70N/tAz7LSK/L/so6M0WDZ+s/s04t
	DwJj9VkAG9zC15a0WwpanQGMbckEWcqsRtUfCDBOudB9PD+KXCZwy8bjfS8qXIZZZagpUlTkk9pYY
	3guvo6fwVFOLMJkmaEGJKBq/JYVZVATYI9/LBhZz5PeGAdSknIpqpf8pfv6FO4550r7sWGn/pVikA
	nEjAu511+ZCWUxNP6zyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwJjn-0000yJ-I5; Tue, 28 Jan 2020 05:48:35 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwJjl-0000xZ-2S
 for linux-snps-arc@lists.infradead.org; Tue, 28 Jan 2020 05:48:34 +0000
Received: by mail-qk1-x743.google.com with SMTP id x1so12198900qkl.12
 for <linux-snps-arc@lists.infradead.org>; Mon, 27 Jan 2020 21:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=LCR4yoPyKXUQ+V6Rzx8Vr1pGJBzG7ybCO5xmGhWVO2E=;
 b=Hma1sjKpCAmCNDeQeafPYa2ae6jBDESB1PCm6wfy4m1d7M9+BWh8FVkywYWY7ykCiy
 SzQx25lgeC+4duHJWx6KqUIh8QXTw8di5MeaGwQuHHn89Nhc7uYjdWvvsMbKeA7vFD83
 eZ0ttxqv+O0UBv0Q1ELfjNP83to7CnSAWkh7s2C27oDB+u7jHIZRBxLZHGidOdsQf1JK
 mEEo4/yiVKjxGyBlmRHpRnDqvkuHhNTxRoPqy1Zumzpfc60DAz3G+S+hPw5+FUChoT/q
 bS0YqS6g/Diq0QYdhlCFXqUUyepH5ufSRHLX0WMtxLjOyn6wC8W9mPq32swU9Z657Mb6
 aYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=LCR4yoPyKXUQ+V6Rzx8Vr1pGJBzG7ybCO5xmGhWVO2E=;
 b=GI++bzzQ2Eh8hS+CvkneEoMDoAeKsbTszWUclzE+ES8x/pWOxV7zW7+Il/In7qCfyv
 bOMOcZRAo/o3Mx7ZuRExuncS4AZcoIsbXYg29p7+nECXR7Mq6z9WwBDzafrKjpDW0Ber
 fE2ipJZIO0MgcIzruW63Bc4zPk7bIvK9o9njlvbd7yk30ysKKTJP1QZGdkck+VRykNPU
 CDPaIk3E+JYB1wNeWSw8aWpppqT2LMnG6lgITOKZrqKEskhA2kjXblEd2kCW73PhjPfo
 3tUhfo3wCR60TQu+djL0bbQlhpOMDXOKwqR82P5LKc0DV+9bL4jHcPI15RfqdXp36JRT
 Bb6g==
X-Gm-Message-State: APjAAAXDjbsTad7GppfLF6NGOZqA6TktqeXG0JSgkK/zyRIedcEjFtwY
 rpGfNQXFATUVgUjJNoAWbVlHZ97ijmauUQ==
X-Google-Smtp-Source: APXvYqwn3oHOOTfkm4bMswvjR/8+st1VKZNpzuQd0q1CmHzfURBt8o3+PL4pjZF1Mk5vBV26vMgvyQ==
X-Received: by 2002:ae9:edc8:: with SMTP id
 c191mr20758894qkg.227.1580190511462; 
 Mon, 27 Jan 2020 21:48:31 -0800 (PST)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id 8sm11519536qkm.92.2020.01.27.21.48.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2020 21:48:30 -0800 (PST)
From: Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
Date: Tue, 28 Jan 2020 00:48:30 -0500
Message-Id: <EE5B936C-121E-4322-A285-603D82D59B3A@lca.pw>
References: <012158b7-a40e-050f-cd1b-d6ce7faf042f@arm.com>
In-Reply-To: <012158b7-a40e-050f-cd1b-d6ce7faf042f@arm.com>
To: Anshuman Khandual <Anshuman.Khandual@arm.com>
X-Mailer: iPhone Mail (17C54)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200127_214833_166796_A5432429 
X-CRM114-Status: GOOD (  13.01  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <Mark.Rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Ingo Molnar <mingo@kernel.org>, Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Cgo+IE9uIEphbiAyNywgMjAyMCwgYXQgMTE6NTggUE0sIEFuc2h1bWFuIEtoYW5kdWFsIDxBbnNo
dW1hbi5LaGFuZHVhbEBhcm0uY29tPiB3cm90ZToKPiAKPiBBcyBJIGhhZCBtZW50aW9uZWQgYmVm
b3JlLCB0aGUgdGVzdCBhdHRlbXB0cyB0byBmb3JtYWxpemUgcGFnZSB0YWJsZSBoZWxwZXIgc2Vt
YW50aWNzCj4gYXMgZXhwZWN0ZWQgZnJvbSBnZW5lcmljIE1NIGNvZGUgcGF0aHMgYW5kIGludGVu
ZCB0byBjYXRjaCBkZXZpYXRpb25zIHdoZW4gZW5hYmxlZCBvbgo+IGEgZ2l2ZW4gcGxhdGZvcm0u
IEhvdyBlbHNlIHNob3VsZCB3ZSB0ZXN0IHNlbWFudGljcyBlcnJvcnMgb3RoZXJ3aXNlID8gVGhl
cmUgYXJlIHBhc3QKPiBleGFtcGxlcyBvZiB1c2VmdWxuZXNzIGZvciB0aGlzIHByb2NlZHVyZSBv
biBhcm02NCBhbmQgb24gczM5MC4gSSBhbSB3b25kZXJpbmcgaG93Cj4gZWxzZSB0byBwcm92ZSB0
aGUgdXNlZnVsbmVzcyBvZiBhIGRlYnVnIGZlYXR1cmUgaWYgdGhlc2UgcmVmZXJlbmNlcyBhcmUg
bm90IGVub3VnaC4KCk5vdCBzYXlpbmcgaXQgd2lsbCBub3QgYmUgdXNlZnVsLiBBcyB5b3UgbWVu
dGlvbmVkIGl0IGFjdHVhbGx5IGZvdW5kIGEgYnVnIG9yIHR3byBpbiB0aGUgcGFzdC4gVGhlIHBy
b2JsZW0gaXMgdGhhdCB0aGVyZSBpcyBhbHdheXMgYSBjb3N0IHRvIG1haW50YWluIHNvbWV0aGlu
ZyBsaWtlIHRoaXMsIGFuZCBub2JvZHkga25ldyBob3cgdGhpbmdzIGNvdWxkIGJlIGJyb2tlbiBl
dmVuIGZvciB0aGUgaXNvbGF0ZWQgY29kZSB5b3UgbWVudGlvbmVkIGluIHRoZSBmdXR1cmUgZ2l2
ZW4gaG93IGNvbXBsaWNhdGVkIHRoZSBrZXJuZWwgY29kZSBiYXNlIGlzLiBJIGFtIG5vdCBzbyBw
b3NpdGl2ZSB0aGF0IG1hbnkgZGV2ZWxvcGVycyB3b3VsZCBlbmFibGUgdGhpcyBkZWJ1ZyBmZWF0
dXJlIGFuZCB1c2UgaXQgb24gYSByZWd1bGFyIGJhc2lzIGZyb20gdGhlIGluZm9ybWF0aW9uIHlv
dSBnYXZlIHNvIGZhci4gCgpPbiB0aGUgb3RoZXIgaGFuZCwgaXQgbWlnaHQganVzdCBiZSBnb29k
IGF0IG1haW50YWluaW5nIHRoaXMgdGhpbmcgb3V0IG9mIHRyZWUgYnkgeW91cnNlbGYgYW55d2F5
LCBiZWNhdXNlIGlmIHRoZXJlIGlzbuKAmXQgZ29pbmcgdG8gYmUgdXNlZCBieSBtYW55IGRldmVs
b3BlcnMsIGZldyBwZW9wbGUgaXMgZ29pbmcgdG8gY29udHJpYnV0ZSB0byB0aGlzIGFuZCBldmVu
IG5vdGljZWQgd2hlbiBpdCBpcyBicm9rZW4uIFdoYXTigJlzIHRoZSBwb2ludCBvZiBnZXR0aW5n
IHRoaXMgbWVyZ2VkIGFwYXJ0IGZyb20gYmVpbmcgZ2V0dGluZyBzb21lIG1lYW5pbmdsZXNzIGNy
ZWRpdHM/Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25w
cy1hcmMK
