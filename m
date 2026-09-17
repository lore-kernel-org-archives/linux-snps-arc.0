Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A47C982CC
	for <linux-snps-arc@archiver.kernel.org>; Thu, 17 Sep 2026 01:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+wJVAqmurboV17/yepijzTnmbPG4kz0TR6H7PyCR1LM=; b=GcAGhorFPf93je
	bXzxG7gCrw1Q4r8u+L42VgMayoVx9Lk5jpyfqwNHlNf/Pi4/0zUCDKym6jfJXXa5zCL0OtxoQUi9c
	Rw+EADVc+DCW2d5niouOFrMvKczDLsI/WYK1fC/kwBHKKOIeKY97vcCrFePMV6k+URd3ecO4ZQz0Q
	liGDDrVeRZwpXG0s8Y1QJYRcydvYxG6yBybqQbG4oszOgPuoZDk3/wV3n0QOL2QfRHoPhjcuL9/JH
	UiEcFNJzyv5a4WqNXHzmQtl/f13ei/3P5zRT0aiBTFc1TKp4ZypYYOPNxywr+E7zogjWYCkVZRzLj
	cpy/2eCv7t9kW3bHL3PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x714i-0000000AQ4P-2P8E;
	Thu, 17 Sep 2026 01:38:08 +0000
Received: from mail-qv2-x0f.google.com ([2607:f8b0:4864:33::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x714g-0000000AQ41-2Q2V
	for linux-snps-arc@lists.infradead.org;
	Thu, 17 Sep 2026 01:38:07 +0000
Received: by mail-qv2-x0f.google.com with SMTP id 6a1803df08f44-910431849a0so1682546d6.3
        for <linux-snps-arc@lists.infradead.org>; Wed, 16 Sep 2026 18:38:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789609085; cv=none;
        d=google.com; s=arc-20260327;
        b=Skw7afbUpar5SfXj45pSuAclexJZ4RVytWAbGpCw19g+qIeglovC6TvIsEZU0XH2AB
         R2dVMAHqNhK9XcjCqRlLR9pXtXZRHlk7yl2adppeEzwheaFxHosuzw8AIJscftnYmcVv
         9h3fZ7R85KLJLmsrIh/G824+SgkZ5a1BwjJPu6OsZ2VaUNiS5QnTs8UXf/U+CwbHjYuM
         ptzGx1AkOqSxvYp4aW9AMJrCKepRkrZ0jeJ/mvEzdht1TcRo959vYQcAy0+dpwPY78Ea
         +TYJ+7+/KcKTDO1+vttNoCWhq1dVWiEVggXbNOT/IOs+wviAE9f6yYEz8uPvMpR7cK3a
         BbwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OQRUPW6YJQIkC46/KpIizzCCGCnEQ9KqApfgS7uijf8=;
        fh=wrY+YxrP/Zk4W+yAT1ND7QRBmvsHl+0+n2yY5xcP0pI=;
        b=X9y9LjhFFgrei7d/LocRKDc6gptXjLdjOR6iE67AFxRqj2rxtUX6B0YMmYU9X6QuXu
         oAKJHbBdBIlSyJGAB2QmiKasnL7qdDw7SDs+lkK1vTFxxD9HX9Q6b73jqkAWRLKmv9bT
         fzML4Kz/RuW3UCPvQq5YkacsfOmKEMLb6ZtakwQN6qMIG7FHYCmgoPm+KTBnfuUdZ7rm
         oLhVxeAj7eGM3ED/HqVN7is4xZUFd8Jn3huzUluDgHeF4sAPRpwS0poL70Wz+X90OMes
         isq2D/DWEvz54b2I8i6HPy2ItjyPC+fnplfwNBqClg1DWzw7fWb5S4ICUVT3bh+M8XhK
         crxA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789609085; x=1790213885; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OQRUPW6YJQIkC46/KpIizzCCGCnEQ9KqApfgS7uijf8=;
        b=ETahf+jZIYoXpEOnxGo7QUYSCjsFJFE9bZB1f8WtPxbsaWeKIpgPZ7scWXiAP02g1y
         GAoJXATz6s/MGenfgQf2ySTZORKVjjUE+0C/otSYGyb3HMvqhnLYpyLCJFeayk81wmM8
         fqSFVFlM3b/h6u7FFtBrh0pVM2vwmh6Wo2380OaPktr2uA2JrEW8YQgMhKwQE7syMV6u
         ZoPqoRf6PuwuEG8kbEw4oJnCBTtGrN+T9JDG8TIXtyHwNpKC7x4OYtLbR3oZG6X/GT/S
         JNJ+zvPH30OwyUr1/rB2ft3D5tkH6FP8MxsCVYnZTljipFHYlIxgCSnRJGky2S/kSGPn
         3NSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789609085; x=1790213885;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OQRUPW6YJQIkC46/KpIizzCCGCnEQ9KqApfgS7uijf8=;
        b=1Cr+JHd8njGjX6xpvkYhJFc3mMLZcHTTkJlBKU0jhXh4oMyMo9VpuZPDlWutZLplCO
         fjteIBQYtbliM0vHX8MFcxAJ+BfrP5OM/vBqC+rwLOR32Xsc3UaK0+VY49AG03a6MJUK
         BNbXa2zX+Qh3BuwF/nX4GT4mqlG2NxDMDigCGQdcHsgtZzOiEhTS9ic2RhK8WjN0TrVh
         DFu2O/qUKnCKJx8GqMCwUySYQqxoddIjZEdvx6oL/TkLHefM/TkJ+xlRUwsxv/zFufLj
         C6vn0Qctol3c5eh3qLQZlmN+wcuqQCkVoyJNpgUnO+WWciKupq9+r6etmbvE8G1FHZ6u
         wV4w==
X-Forwarded-Encrypted: i=1; AKwUvBye2OFxKqkOrNPX6/F1XddDcgeWx8YYNp0ZjdVwnHoeoc6344K+Ka2W4r+Var7L715FR88wrdyiA4RRKmaSOA==@lists.infradead.org
X-Gm-Message-State: AFuF++ny0F3F8MrckHjzgA1Z64ZdutJzOQVroUyGgq3iTUPoIilWk8+9
	qrNQlE9SJh/h/A9gBQs7GU+AteYd6oWAdTL4LHFxduHvPWNGft7NSEExBnFrXE4A2Ng6GFqIRT6
	PYVvlQO//tSpzjPKtSOnb9KkTs8efymyZGQ==
X-Gm-Gg: AYBFou1AxBtdIaHYA578T6dSE6ZIPaRaGusvt8HDTcjNSJ7Ax2OTleK2e2oehxevqGG
	RdePx9EnwtV7qBzr374TuQ7/dteQ4faeHTySxr3AMDG/BV2Xt2j/UwaUeXQ7JeRQNmfV29mGz4C
	HKUiRsZ6cRduN8FgOd+BrFfI/z5fDJ62puNqhOuDIz2YDLeXcSOJiBvk5brpIPoCxRnb5nReAWA
	NHzv5VovZ0ieAuUAJnf4XRNzvj95i/izfd0v7//8ABFH3uARowSzPhfz4a6YQQpK/Wd6wegXMRe
	Xk/iR/Gu8gibn+wKtOZwMG9HNcq2iVS5in6KrZtURP3Y8uPDHlpN3hR/Lk0siZBdhfzae5FVx0H
	Cay8OxX4c+TuqPxQlJm3dWonHb2z9tBi022ApU9oOc9AOQ+4n0HLBzVNSxgbDZAqDw70nWgjSow
	4=
X-Received: by 2002:a05:620a:2b49:b0:939:10dd:9c01 with SMTP id
 af79cd13be357-93bb78ecc33mr880261085a.38.1789608740708; Wed, 16 Sep 2026
 18:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260916200215.21774-1-brads@mainlining.org> <20260916200215.21774-6-brads@mainlining.org>
In-Reply-To: <20260916200215.21774-6-brads@mainlining.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 16 Sep 2026 18:32:08 -0700
X-Gm-Features: AcwNN1WCG_JOJrf2Xbrmh8jFY2fRzqOy5q6E4Cc5_T2BPoTD4KB-hY5Oy_mqGNs
Message-ID: <CAMo8BfLSWyDpxZuePsOdwRks9CuwXiUQBOR5ioSx4GHf_NeZAQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] xtensa: Emulate two-byte cmpxchg
To: Bradley Morgan <brads@mainlining.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vineet Gupta <vgupta@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, Chris Zankel <chris@zankel.net>, Arnd Bergmann <arnd@arndb.de>, 
	"Paul E . McKenney" <paulmck@kernel.org>, David Laight <david.laight.linux@gmail.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-snps-arc@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_183806_615617_6C4BC93E 
X-CRM114-Status: GOOD (  12.51  )
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

T24gV2VkLCBTZXAgMTYsIDIwMjYgYXQgMTowMuKAr1BNIEJyYWRsZXkgTW9yZ2FuIDxicmFkc0Bt
YWlubGluaW5nLm9yZz4gd3JvdGU6Cj4KPiBYdGVuc2EgaGFzIG5vIHR3by1ieXRlIGF0b21pYyBj
b21wYXJlIGFuZCBzd2FwLCBzbyB0aGUgX19jbXB4Y2hnKCkKPiBzd2l0Y2ggbGV0cyBjYXNlIDIg
ZmFsbCB0aHJvdWdoIHRvIF9fY21weGNoZ19jYWxsZWRfd2l0aF9iYWRfcG9pbnRlcigpLAo+IHdo
aWNoIGlzIGRlY2xhcmVkIGJ1dCBuZXZlciBkZWZpbmVkLCBzbyBhIHR3by1ieXRlIGNtcHhjaGco
KSBmYWlscyBhdAo+IGxpbmsgdGltZS4gUm91dGUgY2FzZSAyIHRocm91Z2ggdGhlIG5ldyBjbXB4
Y2hnX2VtdV91MTYoKSwgd2hpY2ggdGFrZXMKPiBuYXR1cmFsIHUxNiBhcmd1bWVudHMsIHNvIHRo
ZSB1bnNpZ25lZCBsb25nIG9sZCBhbmQgbmV3IG5hcnJvdyBhdCB0aGUKPiBmdW5jdGlvbiBib3Vu
ZGFyeS4KPgo+IFNpZ25lZC1vZmYtYnk6IEJyYWRsZXkgTW9yZ2FuIDxicmFkc0BtYWlubGluaW5n
Lm9yZz4KPiAtLS0KPiAgYXJjaC94dGVuc2EvaW5jbHVkZS9hc20vY21weGNoZy5oIHwgMSArCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKUmV2aWV3ZWQtYnk6IE1heCBGaWxpcHBv
diA8amNtdmJrYmNAZ21haWwuY29tPgoKLS0gClRoYW5rcy4KLS0gTWF4CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5n
IGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
