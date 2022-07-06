Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33402C433EF
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 Jul 2022 09:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tIR/NyzOExQ4G5bei8rp/H2DDpEq+3q1lCbROGAI/Rk=; b=dd5mYEqtsGPWbI
	Sy5hsSXCMMPRB1svLwAmH0S4u2tsV7ddMRrrJUHoJMSMyOLADF+Cd5x//dbxDpCyCb/FNyUx9pa4E
	VKaU1NYR532TnpbU02G+pp8s/tWJmT8YhfzYE/UqVr+HFo0vzm5Giv+rGhInzo8R8ggBSuc8xUtqi
	xMuNZcgJBNJdsmbV0QTy3rFZeIa7guiJQBP4CBRx6/Faa0Mp4CPm1iGlgQ0A7HrIpKew4LQT2k/BE
	qLFqBGAA4bieN06v7pdeWgSXudmzkl0Pi5B1f+jbzvgIFYgWWd16DFMtrtilegkqadJqyVI+SEi1B
	BXoCpWWuur8uPwpWsDFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o91MT-007ncn-QN; Wed, 06 Jul 2022 09:30:21 +0000
Received: from mail-qk1-f171.google.com ([209.85.222.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o91MO-007naT-CH
	for linux-snps-arc@lists.infradead.org; Wed, 06 Jul 2022 09:30:20 +0000
Received: by mail-qk1-f171.google.com with SMTP id g1so10587952qkl.9
        for <linux-snps-arc@lists.infradead.org>; Wed, 06 Jul 2022 02:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=X0E6/6svoPI75a545bMY+0MRF9DfMtB/2WCtrH+xzXg=;
        b=Iol+k/AMoy91geUsjrAV0MZ0ZZ8X/k1g6rffS+MwF3hUlEi+nDYLuYVpW2UT1G1zkk
         GWUX7OvyCCtZmmPv1QTDqw0IVWfhXB6VPcJUCWksbMjiEWOhP538ML5nmqUCh4HMquek
         nWIyCKXAQjSteIoThYNfeYWZ8gHMtg9p7CNe/Qcyt8z6WtCyT8mwae+5xCfNgz5fgVic
         FD2KFZ4RsHG/CXxtBT/REskZF6idqIQ+5GFWWIq9EVeZjxU4OzyJoOtTX6wXd+xiPJzz
         pcye5oY2Z9IJ/VbOxvrOE057w9IwOnKWasd+oUL2tlys8GuFgvvOjUKGBF62gIlUL+9/
         YAJQ==
X-Gm-Message-State: AJIora9pWxiqrDCWs9bOLQDrDKnwZYPMoS8WMr0/fdyx+qkclgQoSobE
	FL2FOI2idozYXjEPY3qljepT/5Op+fMYQA==
X-Google-Smtp-Source: AGRyM1vb/HuI/swx4r9ks1AKRXBmj2mduBbiI2vZx/G+MtDPeBsb6IQy9r5LjX7RA1TuyJAGBCCuXQ==
X-Received: by 2002:a05:620a:101c:b0:6b4:8cb4:6b5a with SMTP id z28-20020a05620a101c00b006b48cb46b5amr4068006qkj.28.1657099813708;
        Wed, 06 Jul 2022 02:30:13 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id x7-20020ac81207000000b00304e4bbc369sm24157205qti.10.2022.07.06.02.30.13
        for <linux-snps-arc@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 02:30:13 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id i14so6615036yba.1
        for <linux-snps-arc@lists.infradead.org>; Wed, 06 Jul 2022 02:30:13 -0700 (PDT)
X-Received: by 2002:a05:6902:701:b0:66e:a06d:53d7 with SMTP id
 k1-20020a056902070100b0066ea06d53d7mr788860ybt.604.1657099812787; Wed, 06 Jul
 2022 02:30:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220527115345.2588775-1-amadeuszx.slawinski@linux.intel.com> <20220527115345.2588775-3-amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20220527115345.2588775-3-amadeuszx.slawinski@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Jul 2022 11:30:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVnXGg4T3j5n9PUg6i60-vza1bjNiVp9wqNSqHccMc=-Q@mail.gmail.com>
Message-ID: <CAMuHMdVnXGg4T3j5n9PUg6i60-vza1bjNiVp9wqNSqHccMc=-Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] m68k: bitops: Change __fls to return and accept
 unsigned long
To: =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Cc: Vineet Gupta <vgupta@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Guenter Roeck <linux@roeck-us.net>, arcml <linux-snps-arc@lists.infradead.org>, 
	linux-m68k <linux-m68k@lists.linux-m68k.org>, sparclinux <sparclinux@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Cezary Rojewski <cezary.rojewski@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_023016_533725_8E8FE154 
X-CRM114-Status: GOOD (  15.02  )
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

T24gRnJpLCBNYXkgMjcsIDIwMjIgYXQgMTo1MyBQTSBBbWFkZXVzeiBTxYJhd2nFhHNraQo8YW1h
ZGV1c3p4LnNsYXdpbnNraUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+IEFzIHBlciBhc20tZ2Vu
ZXJpYyBkZWZpbml0aW9uIGFuZCBvdGhlciBhcmNoaXRlY3R1cmVzIF9fZmxzIHNob3VsZAo+IHJl
dHVybiBhbmQgYWNjZXB0IHVuc2lnbmVkIGxvbmcgYXMgaXRzIHBhcmFtZXRlci4KPgo+IE5vIGZ1
bmN0aW9uYWwgY2hhbmdlIGlzIGV4cGVjdGVkIGFzIHJldHVybiB2YWx1ZSBzaG91bGQgZml0IGlu
IHVuc2lnbmVkCj4gbG9uZy4KPgo+IFJldmlld2VkLWJ5OiBDZXphcnkgUm9qZXdza2kgPGNlemFy
eS5yb2pld3NraUBpbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQW1hZGV1c3ogU8WCYXdpxYRz
a2kgPGFtYWRldXN6eC5zbGF3aW5za2lAbGludXguaW50ZWwuY29tPgoKUmV2aWV3ZWQtYnk6IEdl
ZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+CmkuZS4gd2lsbCBxdWV1ZSBp
biB0aGUgbTY4ayBmb3ItdjUuMjAgYnJhbmNoLgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAg
ICAgICAgICAgICAgICAgICBHZWVydAoKLS0KR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3Mg
bG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVy
c29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYg
YSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkg
InByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1z
bnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
