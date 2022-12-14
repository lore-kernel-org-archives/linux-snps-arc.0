Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B06C4332F
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Dec 2022 09:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3MEYLqzPTvQprpiLLJa/pkOBg3VWMsUT7NPdc1077d4=; b=JNc2RnjDGFACrv
	uV7FFCXDtI4wpS9PkkbLt58q4t1BQz3iTbBMxdO3wor0v8dvvSsjUh9zhfo0/AtMk/74DLiUa0pgs
	SdDV8PGSnTe41K97HS9E8YCA9ducwZzqYu3mINhDmIe8RoDc/yWb6uOGKz59xX9dk5hSJFUmHY7kj
	ZjXIRt/CrVmWid1D0Oo1l3E1c0O8ErcLTH4UGgT3n6Bu8mijhD3+w/i8hMQ+HmWPkJGnupWpD4oFm
	pkgXTIJR+VBxO+jav33lcxBxX+cuuCPUlPjOQOSyeA+aaFrV+Iccoh4rYEP9GDEbGChnkiea6i+iV
	HInMiWRiol5aomD89f1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Njd-00EwLE-5c; Wed, 14 Dec 2022 09:07:29 +0000
Received: from mail.lokoho.com ([217.61.105.98])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5NjZ-00EwHv-PE
	for linux-snps-arc@lists.infradead.org; Wed, 14 Dec 2022 09:07:27 +0000
Received: by mail.lokoho.com (Postfix, from userid 1001)
	id EB8A1868F5; Wed, 14 Dec 2022 09:06:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lokoho.com; s=mail;
	t=1671008843; bh=Z0N5VlX9/JlryGOL5I747Le9USomZJCRNNGRT3LbbKc=;
	h=Date:From:To:Subject:From;
	b=M4TpULYFXgJJt53jDDsFctKY3OwMpnM8kXOPN0f3+M/CNAhZeJHS1pOOqrHNgCkdO
	 5Nyd4gc/xPBkCtVy5/74S1ac5vAhzi9E6abTxMwwffflH/mpR5e7RTqNYJAlG1NoyG
	 9puUkjYkzTz/CoS2TQUzyqAaa7JEmBSQeVVkxrKj8nxPVwfHG0CzMHaVayLozfCCi1
	 71tEMKKF78NSWwlfeFoM/+yc92qBWOwq5ULDoHMNzIvES/KzqCzJDyae7+zqIVsReY
	 R+k4KHhSIeHdxryxYjLAbpwTty7SDWiB+/OU9vPczkpqxiYLj0NQVtA9wEuaSeiTn1
	 BMvJJ8+mmmJUw==
Received: by mail.lokoho.com for <linux-snps-arc@lists.infradead.org>; Wed, 14 Dec 2022 09:05:06 GMT
Message-ID: <20221214074502-0.1.2t.9rpb.0.3agbqn4cf9@lokoho.com>
Date: Wed, 14 Dec 2022 09:05:06 GMT
From: "Adam Charachuta" <adam.charachuta@lokoho.com>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.lokoho.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_010726_011664_9A59EAC0 
X-CRM114-Status: UNSURE (   1.03  )
X-CRM114-Notice: Please train this message.
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

RHppZcWEIGRvYnJ5LAoKemFwb3puYcWCZW0gc2nEmSB6IFBhxYRzdHdhIG9mZXJ0xIUgaSB6IHBy
enlqZW1ub8WbY2nEhSBwcnp5em5hasSZLCDFvGUgcHJ6eWNpxIVnYSB1d2FnxJkgaSB6YWNoxJlj
YSBkbyBkYWxzenljaCByb3ptw7N3LiAKClBvbXnFm2xhxYJlbSwgxbxlIG1vxbxlIG3Ds2fFgmJ5
bSBtaWXEhyBzd8OzaiB3a8WCYWQgdyBQYcWEc3R3YSByb3p3w7NqIGkgcG9tw7NjIGRvdHJ6ZcSH
IHogdMSFIG9mZXJ0xIUgZG8gd2nEmWtzemVnbyBncm9uYSBvZGJpb3Jjw7N3LiBQb3p5Y2pvbnVq
xJkgc3Ryb255IHd3dywgZHppxJlraSBjemVtdSBnZW5lcnVqxIUgxZt3aWV0bnkgcnVjaCB3IHNp
ZWNpLgoKTW/FvGVteSBwb3Jvem1hd2lhxIcgdyBuYWpibGnFvHN6eW0gY3phc2llPwoKClBvemRy
YXdpYW0KQWRhbSBDaGFyYWNodXRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
