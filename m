Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E95CC77B75
	for <linux-snps-arc@archiver.kernel.org>; Tue, 23 May 2023 09:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ya4Weon4j+H2RDXdqr414dgBZcJjvQz1yo+Wq2DvSGI=; b=NI2wbZCjgf+3O7
	d+tlB0JgGu6b0//jjzJQzwCVNUNE2ArohHP4JDgwC0p37UftvX2lCqugvCpHCwC3oM6HnDU44IQXQ
	MyJ4I8h97tg08Yqwut0p564veVpWVR5/FLl535L3LSK+acCgz+UwBuxKR1dyclG9MU7PkD43i/TJv
	D8eOq/UMwMqa/7rGlh5KXtNdjB/bfCQxXn1QU5VQbZGu/00zUxBRH8KyUALqjy6M65wM/JsuwH7Hs
	XGlbwjhOLtAeVmVtWema1hZUxC4Zyox5n6Tfyk25Ct99jBpE4JE86QgvzpTIUQhI68bk0/n71MG1s
	XiuFaWrYDQYknIAk8+ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1OE7-009bVs-2N;
	Tue, 23 May 2023 09:22:43 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1OE4-009bUS-2y;
	Tue, 23 May 2023 09:22:42 +0000
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6af89b0f3e5so1005692a34.0;
        Tue, 23 May 2023 02:22:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684833759; x=1687425759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ElqaZMSGIZr1PDsUyYzS4b4CKhVSDM9bJ+kKBcpqibs=;
        b=IJEm9enrCfrQAYBnaZENp0TOuFGkQlv1Do+uDbTIhrII44KOfycUxYZieYl35/ZKEA
         Lc6XGNHE9nnuTkskmxEHB1bm0I2km0QHvBWpAqoMFZhPqqrzBSS8lukQrKbVe3jocWNN
         TFewmjgbEezIWKX8AAieWtaNpmbmrJYHtKFYYsbmvUyBgnbFnqgcCo7SaMaBi8glZgAB
         Wjb1uB1WhhnLTmjklA2BzT65qlrZwIBrCuKxuVmppFfjE+M6WMNuh17opqL8viCgP/yt
         KKgz5L4MDPcGQqFccPy2gfugdq7nTn7dHi1iRRTukDxr8E8CkAJyHp1gT6CFYr64j4YG
         Wvcg==
X-Gm-Message-State: AC+VfDzjmY+8PntUyHrDQ42U9cH/bpSrt4KHB/lRzoqaKyKXIuKaPW9d
	8NfBeD/oyt9LTnuQ702J5uaM18ZiLdtBWA==
X-Google-Smtp-Source: ACHHUZ7+czTXH6G0YgjDtolFnH+rMNw5bAbSIn9IKs+sBzlrp+CuVgowj6iy08le+fAw41p/zNKADw==
X-Received: by 2002:a05:6830:1313:b0:6ac:6fd8:1e4 with SMTP id p19-20020a056830131300b006ac6fd801e4mr7109333otq.8.1684833758761;
        Tue, 23 May 2023 02:22:38 -0700 (PDT)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com. [209.85.161.46])
        by smtp.gmail.com with ESMTPSA id z13-20020a0568301dad00b006ab26c69534sm3244428oti.23.2023.05.23.02.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 02:22:38 -0700 (PDT)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5527167350bso4514893eaf.3;
        Tue, 23 May 2023 02:22:37 -0700 (PDT)
X-Received: by 2002:a81:5bc6:0:b0:562:16d7:e6eb with SMTP id
 p189-20020a815bc6000000b0056216d7e6ebmr15255699ywb.40.1684833736388; Tue, 23
 May 2023 02:22:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230523091139.21449-1-vbabka@suse.cz>
In-Reply-To: <20230523091139.21449-1-vbabka@suse.cz>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 May 2023 11:22:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWRZmA1iEG2aXdKZ+wWgSTgg-P7KY7pTTJx9EmvuEa58A@mail.gmail.com>
Message-ID: <CAMuHMdWRZmA1iEG2aXdKZ+wWgSTgg-P7KY7pTTJx9EmvuEa58A@mail.gmail.com>
Subject: Re: [PATCH] mm/slab: rename CONFIG_SLAB to CONFIG_SLAB_DEPRECATED
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, 
	David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Hyeonggon Yoo <42.hyeyoo@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Vladimir Zapolskiy <vz@mleia.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Qin Jian <qinjian@cqplus1.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S . Miller" <davem@davemloft.net>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_022240_982187_7341082F 
X-CRM114-Status: GOOD (  18.51  )
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

SGkgVmxhc3RpbWlsLAoKVGhhbmtzIGZvciB5b3VyIHBhdGNoIQoKT24gVHVlLCBNYXkgMjMsIDIw
MjMgYXQgMTE6MTLigK9BTSBWbGFzdGltaWwgQmFia2EgPHZiYWJrYUBzdXNlLmN6PiB3cm90ZToK
PiBBcyBkaXNjdXNzZWQgYXQgTFNGL01NIFsxXSBbMl0gYW5kIHdpdGggbm8gb2JqZWN0aW9ucyBy
YWlzZWQgdGhlcmUsCj4gZGVwcmVjYXRlIHRoZSBTTEFCIGFsbG9jYXRvci4gUmVuYW1lIHRoZSB1
c2VyLXZpc2libGUgb3B0aW9uIHNvIHRoYXQKPiB1c2VycyB3aXRoIENPTkZJR19TTEFCPXkgZ2V0
IGEgbmV3IHByb21wdCB3aXRoIGV4cGxhbmF0aW9uIGR1cmluZyBtYWtlCj4gb2xkY29uZmlnLCB3
aGlsZSBtYWtlIG9sZGRlZmNvbmZpZyB3aWxsIGp1c3Qgc3dpdGNoIHRvIFNMVUIuCj4KPiBJbiBh
bGwgZGVmY29uZmlncyB3aXRoIENPTkZJR19TTEFCPXkgcmVtb3ZlIHRoZSBsaW5lIHNvIHRob3Nl
IGFsc28KPiBzd2l0Y2ggdG8gU0xVQi4gUmVncmVzc2lvbnMgZHVlIHRvIHRoZSBzd2l0Y2ggc2hv
dWxkIGJlIHJlcG9ydGVkIHRvCj4gbGludXgtbW0gYW5kIHNsYWIgbWFpbnRhaW5lcnMuCgpUZWNo
bmljYWxseSwgcmVtb3ZpbmcgdGhlc2UgbGluZXMgZnJvbSB0aGUgZGVmY29uZmlnIGZpbGVzIGRv
ZXMgbm90CmhhdmUgYW55IGltcGFjdCwgcmlnaHQ/CkFuZCBpdCByZW1vdmVzIG9uZSBtb3JlIHN5
bmMgcG9pbnQgaW5kaWNhdGluZyB0aGUgbGFzdCB0aW1lIHNvbWUKZGVmY29uZmlnIGZpbGVzIHdl
cmUgKG5vdCkgdXBkYXRlZCBieSB0aGVpciBtYWludGFpbmVycyA7LSkKCj4gWzFdIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC80YjlmYzljNi1iNDhjLTE5OGYtNWY4MC04MTFhNDQ3MzdlNWZA
c3VzZS5jei8KPiBbMl0gaHR0cHM6Ly9sd24ubmV0L0FydGljbGVzLzkzMjIwMS8KPgo+IFNpZ25l
ZC1vZmYtYnk6IFZsYXN0aW1pbCBCYWJrYSA8dmJhYmthQHN1c2UuY3o+Cgo+ICBhcmNoL202OGsv
Y29uZmlncy9hbWlnYV9kZWZjb25maWcgICAgICAgICAgICAgICB8ICAxIC0KPiAgYXJjaC9tNjhr
L2NvbmZpZ3MvYXBvbGxvX2RlZmNvbmZpZyAgICAgICAgICAgICAgfCAgMSAtCj4gIGFyY2gvbTY4
ay9jb25maWdzL2F0YXJpX2RlZmNvbmZpZyAgICAgICAgICAgICAgIHwgIDEgLQo+ICBhcmNoL202
OGsvY29uZmlncy9idm1lNjAwMF9kZWZjb25maWcgICAgICAgICAgICB8ICAxIC0KPiAgYXJjaC9t
NjhrL2NvbmZpZ3MvaHAzMDBfZGVmY29uZmlnICAgICAgICAgICAgICAgfCAgMSAtCj4gIGFyY2gv
bTY4ay9jb25maWdzL21hY19kZWZjb25maWcgICAgICAgICAgICAgICAgIHwgIDEgLQo+ICBhcmNo
L202OGsvY29uZmlncy9tdWx0aV9kZWZjb25maWcgICAgICAgICAgICAgICB8ICAxIC0KPiAgYXJj
aC9tNjhrL2NvbmZpZ3MvbXZtZTE0N19kZWZjb25maWcgICAgICAgICAgICAgfCAgMSAtCj4gIGFy
Y2gvbTY4ay9jb25maWdzL212bWUxNnhfZGVmY29uZmlnICAgICAgICAgICAgIHwgIDEgLQo+ICBh
cmNoL202OGsvY29uZmlncy9xNDBfZGVmY29uZmlnICAgICAgICAgICAgICAgICB8ICAxIC0KPiAg
YXJjaC9tNjhrL2NvbmZpZ3Mvc3VuM19kZWZjb25maWcgICAgICAgICAgICAgICAgfCAgMSAtCj4g
IGFyY2gvbTY4ay9jb25maWdzL3N1bjN4X2RlZmNvbmZpZyAgICAgICAgICAgICAgIHwgIDEgLQoK
UmVnYXJkbGVzcywKQWNrZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0
CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQg
aWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3
aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEkn
bSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0
aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMg
VG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
c25wcy1hcmMK
