Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990A2C433EF
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Dec 2021 08:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4Tr+8bZn6/aPLoLU5kmQ/SdfKDwA0XCuNW/QXH/iFJU=; b=zEcz9rr0m1lmbU
	x8XH12MGuCzpMRxo4jLD8RdYKn7Ivvt6Mu1CGKkYFW5BfVRuFYJMQO/Z572WLmmu4EIdeCwcYqu31
	RCBF7ChcCRxOGxMjgmVoib2iwMOBphU3sb3KHbAY8lD3AUPzvPvseLXRUQEpGgJVccKS7y/2/liEo
	DC1aWT9SRqDnwnwLHYeb5UiKdi51VDzMiaX9VS/W3+TWqXFxe3vNE3baY4yp5IuSyCuV1UD4hCbK1
	dWzxKIk34ebUAyWbOvuSy5pkILj/DzmI51kqvq9OU+azSu+SuNh58wfvz03R+mjaP6d+c18d7aTLJ
	Kqbr4s3EDfneaOXqTxew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n282g-000RVu-KV; Tue, 28 Dec 2021 08:41:10 +0000
Received: from mail.viperton.pl ([158.255.215.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n282d-000RTv-Ps
 for linux-snps-arc@lists.infradead.org; Tue, 28 Dec 2021 08:41:09 +0000
Received: by mail.viperton.pl (Postfix, from userid 1001)
 id 0049B40BC0; Tue, 28 Dec 2021 09:40:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=viperton.pl; s=mail;
 t=1640680846; bh=AvCDz9looobjZdFhykIyLT4goOBH1vEWAdG7r05k3VI=;
 h=Date:From:To:Subject:From;
 b=IYB2orY51Yp68TfnFoVvswzvF6WxlTDkCLrSjMRA2a3lVnlQ26+t4MnF41MIdOGLm
 qgTKI2YxxyV+lFjhMf3XDHI2NERhzcN1EUDnr6wMCsRkFD8w4QyWXwD0dh8JjNzoPg
 zatYrysQqKQk25gc0XLKVQPx1tOwuM3TKXhLejiRw03/twigwstBfIsGJ7R4rap1kn
 7DBcRrW7BYnS5Gq9RZgGe3sE68m3tcBFE2RShE5NkS4W5xRH51+GrvGzrBdmEc0VjD
 rzGTo11MFS/wiiGJ4g60G9xAJWHNZcc96FC7fYGRGsjU+LegVVR+QMIla+mgR2++7n
 XrxrQYg+pjz5Q==
Received: by mail.viperton.pl for <linux-snps-arc@lists.infradead.org>;
 Tue, 28 Dec 2021 08:40:37 GMT
Message-ID: <20211228084500-0.1.y.33xg.0.lb8uj3jhh3@viperton.pl>
Date: Tue, 28 Dec 2021 08:40:37 GMT
From: "Dominik Perkowski" <dominik.perkowski@viperton.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.viperton.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_004108_057216_0928D79F 
X-CRM114-Status: UNSURE (   0.98  )
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
YXdpYW0sCkRvbWluaWsgUGVya293c2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1h
cmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
