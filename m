Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568C4C83F17
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Jul 2025 10:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6adPs3Vi0iZ7Ww2aqe3d2hKK1ZWVA8NMXBPwRFK/1Yc=; b=iXxJN+tzAXbAql
	nwVKw6MxMoRy3QA4pBNECU9YS7vIfBxCbaGrFgtyiainaoITXpObcLa2W29xa4g/HlNL0TUWRtdKC
	iBxGRUutzCQd7cSfokTF6i3iyJ5k8T057x2e2PPXGb9HYpjoR9jpDBGbLBgT4LEAt1hadpvbZPCly
	UriEfVzrF841kko0oSvYs+CLf9nf6ftKneIAXVzAzqUpYgZIzTQTz3aYEkBkZfVR80vol4bRZf1Nz
	7Yetj1WfNcMzgzQFImHhpXGMNCQS/rNDAg90IBeqBAfnOegmmzMcmx65QkdefAepVxAEkzGZAptiG
	+edpuF5rbDnm3I+6xT6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucihD-0000000CM3A-0FiC;
	Fri, 18 Jul 2025 10:52:07 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uciJR-0000000CIUP-0c6E
	for linux-snps-arc@lists.infradead.org;
	Fri, 18 Jul 2025 10:27:34 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e818a572828so1384285276.1
        for <linux-snps-arc@lists.infradead.org>; Fri, 18 Jul 2025 03:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752834452; x=1753439252; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1x8KYMoPHOU/KGMTKlJp4QdTDljWUFg5i2cxTvc6SMc=;
        b=W6LB/lUv/L++WvLNKMUNg+bdWPnx1O4yFLn70xzlHRMpQ2EtkrxKKiLgoMNiZwpWMf
         tjjjxEdl8RDK2/E+Wn4Gu/gTwvDrhV1M8xLq+N0yCxHooP84gkshM8ToUL8kvBkydeBd
         pc5Frz+f0tVtp1YTL5uOxBoJStupeTFq48FV7XYLCr4pEmEn7cP3GN2nJ79xehpviOsm
         2t6VN3JVI5iUwc0rwctxMjVKXfgh6FeianfjniyaDjIcMP6p5xsZhjyzJiuT2f9wQvN8
         v+GXLA0l4QTmteSQcjpqcEeE80z8GOXMIdP2mpwJ9U5mRW9dBOIHMxOBm468gqQeNAAx
         CvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752834452; x=1753439252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1x8KYMoPHOU/KGMTKlJp4QdTDljWUFg5i2cxTvc6SMc=;
        b=gLAZqtkg6MO8hwRqf1bW6FuEd67bShr81SM/1vR8Rsyp3DkmDbcsJNu3dJ2El26gxP
         Xp9aAQ/DWr8bY/GRoGe7dnhMy4Fd2ejdWy0pO7gUHMumbLOlG2ycHUcViHIomITmihQn
         k5GUs5RKE+52Its+UQOTM0k0BfWrGXLTS/5HFWxIeUBSFj95j8RUg2XnRyHCUA1Uyg+r
         wGUIN6elDuoi7xVp+Mu0IkpOOjP0qEGncLnRn636EFEJYaU2Csg7JXEo3GWWBaHeLd3r
         OiYEoepRWIsKMs+afdCQiMXXPJRQ28NYSPNYSqjePBo8Ws1TnE3LvOONE74S4Q0G9ghK
         IARg==
X-Forwarded-Encrypted: i=1; AJvYcCVSrWNFM+JaYLQix3T/LISRoBOW534KhZ5qX3r3EXRn40dMf9AxGQ/FSYAkeAlDVwCkUdVhWYXB1YIFbOb6gQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAajQzXWHigvTRT/n8FGHUabBQcTBDctXShkTO9OXZZgN6ehLI
	1wT2vOxKIHBUhHI3cMWqJYEMeZIWg0+36fzTmdVZsbfTOyzSC0YTJVOx5EUgxQ8uwdIFXYoaIp3
	5IJUqyQzTIHmMHrnrZdsnAiBcQP0apQM=
X-Gm-Gg: ASbGncvE9dBDzcPyVNvYrdEmHVam82m5QvgTbnRG6Hn9csC/BlUtz25wklzceDrNV77
	Qeuxf/zxbXXRys2nYKE3Dyqeed1heh5oSjH4TIz3GP92UGXWybfEeqq7djRcuqbjhgV2QxRRPc5
	QP4+o825ehZ8RLCKNDhHOwvL0R4NPpz/vgyVbUP5tjjxFaCUqTcojjo06CWzM1seb+dXf/38VQa
	7zk+T+U
X-Google-Smtp-Source: AGHT+IHbR0TgrZnHWoh6mc9uul5rXSlPg9jvMrr3O/Uj9MClMiXC9JDrYVKVApD3TRnHdcHCmHq6uDJ+bvpNQuMqzr4=
X-Received: by 2002:a05:690c:38b:b0:708:cd31:88a9 with SMTP id
 00721157ae682-71952350c3amr27819927b3.37.1752834451459; Fri, 18 Jul 2025
 03:27:31 -0700 (PDT)
MIME-Version: 1.0
References: <aGjUpI1yNjEhSiAq@brak3rDesk>
In-Reply-To: <aGjUpI1yNjEhSiAq@brak3rDesk>
From: Rujra Bhatt <braker.noob.kernel@gmail.com>
Date: Fri, 18 Jul 2025 15:57:20 +0530
X-Gm-Features: Ac12FXxoU6aFudyIJiyv4FHEoGIyv9QfAgoxU9dgMhQNxFSC-pmiUNMnb69ONhU
Message-ID: <CAG+54DZQC+-6E-P3D4BUtVujNegL1qKpcB5SGh28+rX5hrHFiw@mail.gmail.com>
Subject: Re: [PATCH] arc:kernel:perf_event.c : replaced sprintf with sysfs_emit()
To: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, vgupta@kernel.org
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_032733_181718_7F07B04D 
X-CRM114-Status: GOOD (  15.26  )
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

SGksCgpPbiBTYXQsIEp1bCA1LCAyMDI1IGF0IDE6MDDigK9QTSBSdWpyYSBCaGF0dCA8YnJha2Vy
Lm5vb2Iua2VybmVsQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBSZXBsYWNlZCBzcHJpbnRmKCkgd2l0
aCBzeXNmc19lbWl0KCkgaW4gc3lzZnMqX3Nob3coKSBmdW5jdGlvbiBpbgo+IHBlcmZfZXZlbnQu
YyBmaWxlIHRvIGZvbGxvdyB0aGUga2VybmVsJ3MgZ3VpZGVsaW5lcyBmcm9tCj4gZG9jdW1lbnRh
dGlvbi9maWxlc3lzdGVtcy9zeXNmcy5yc3QKPiBUaGlzIHdpbGwgaW1wcm92ZSBjb25zaXN0ZW5j
eSwgc2FmZXR5LCBhbmQgbWFrZXMgaXQgZWFzaWVyIHRvIG1haW50YWluCj4gYW5kIHVwZGF0ZSBp
biBmdXR1cmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSdWpyYSBCaGF0dCA8YnJha2VyLm5vb2Iua2Vy
bmVsQGdtYWlsLmNvbT4KPiAtLS0KPiAgYXJjaC9hcmMva2VybmVsL3BlcmZfZXZlbnQuYyB8IDIg
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvYXJjaC9hcmMva2VybmVsL3BlcmZfZXZlbnQuYyBiL2FyY2gvYXJjL2tlcm5l
bC9wZXJmX2V2ZW50LmMKPiBpbmRleCBlZDZkNGYwY2Q2MjEuLjQyNGVjMDcyYzQ0MSAxMDA2NDQK
PiAtLS0gYS9hcmNoL2FyYy9rZXJuZWwvcGVyZl9ldmVudC5jCj4gKysrIGIvYXJjaC9hcmMva2Vy
bmVsL3BlcmZfZXZlbnQuYwo+IEBAIC02NDgsNyArNjQ4LDcgQEAgc3RhdGljIHNzaXplX3QgYXJj
X3BtdV9ldmVudHNfc3lzZnNfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gICAgICAgICBzdHJ1
Y3QgcGVyZl9wbXVfZXZlbnRzX2F0dHIgKnBtdV9hdHRyOwo+Cj4gICAgICAgICBwbXVfYXR0ciA9
IGNvbnRhaW5lcl9vZihhdHRyLCBzdHJ1Y3QgcGVyZl9wbXVfZXZlbnRzX2F0dHIsIGF0dHIpOwo+
IC0gICAgICAgcmV0dXJuIHNwcmludGYocGFnZSwgImV2ZW50PTB4JTA0bGx4XG4iLCBwbXVfYXR0
ci0+aWQpOwo+ICsgICAgICAgcmV0dXJuIHN5c2ZzX2VtaXQocGFnZSwgImV2ZW50PTB4JTA0bGx4
XG4iLCBwbXVfYXR0ci0+aWQpOwo+ICB9Cj4KPiAgLyoKPiAtLQo+IDIuNDMuMAo+CgpHZW50bGUg
cmVtaW5kZXIgZm9yIHRoZSByZXBsYWNlbWVudCBvZiBzcHJpbnRmKCkgd2l0aCB0aGUgc3lzZnNf
ZW1pdCgpLCBraW5kbHkKcmV2aWV3IGl0LgoKVGhhbmtpbmcgeW91LApyZWdhcmRzLApSdWpyYSBC
aGF0dAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBz
LWFyYwo=
