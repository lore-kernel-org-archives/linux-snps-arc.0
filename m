Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6063CC27C53
	for <linux-snps-arc@archiver.kernel.org>; Fri,  7 Jun 2024 08:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YOE8WhJogGtosYg3kAD0fsluRq9MXuSLa4uuarOhIOo=; b=SZiNBeGAF1xrsA
	CGfAe1afwI/EGcj0bE7K2IEATvEson3bdxie2oSbkz6QPCUD2iIVBTYWq7JfSwuNvX2yJHy21Gaxr
	JQvyHQFzTUylBypWDe10VUjV9gkK87XDzqaWDCtSPUnGjsIj9psXm7H/zFgC0MniRmWRfK9/FlVPs
	siCzflwQcY0rBBJSNAOKHCbSD0RyN+9gmfvQn+c2UICO7ley/AHd03vEzcQuMYJDNCNFuG71lbH/H
	3KHIfQOUjjlshXmk9LgjhnTom3uec+wa+RIOwe8sjTtsrgNbMWFgtcRLFQQI0FYLvhRRlZjhwqI4b
	2ZY+YWDNXSemc7fNobdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFUkC-0000000D5CH-2cVN;
	Fri, 07 Jun 2024 08:14:40 +0000
Received: from mail.quirkbyte.pl ([94.177.238.152])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFUkA-0000000D5Bg-1fH9
	for linux-snps-arc@lists.infradead.org;
	Fri, 07 Jun 2024 08:14:39 +0000
Received: by mail.quirkbyte.pl (Postfix, from userid 1002)
	id A2EFC89BE2; Fri,  7 Jun 2024 10:10:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=quirkbyte.pl; s=mail;
	t=1717747858; bh=V4qwQGqC7KpJoyielzRpnopuINFIOvKXsSgJ3ZENIXU=;
	h=Date:From:To:Subject:From;
	b=rMIIWsc5q8Cy/5GADbgPb9OcIHOaCX5t1Lk3IYxDel8EHGIHa7AYczRUqdjzuDS0S
	 4gGHvS4vL7XfbA/ocha4ZG3W1Dp2iUBCnVob7pV5LqnysaHQy+f1N0Tqvjl2lKWXtK
	 bQ87q5SGS8uLZKmgPt0AT7ZAATuhPc2LF2hvzmxoiNJNTxLSkx7quwdoaOQBnXqsnm
	 XN9TXmb9dIUUKnV64lwebjTytKdEtD5i24DygQgD0YCc7bXVpjahgTE3Uu10mS94zY
	 +kDYGQzkJzOW61NDmMMXZO/YLQlpzn/m5BsTksUJe4ivuv/wVQ/nNfx3stBP0GYgr6
	 5xoeQLfygZjXQ==
Received: by mail.quirkbyte.pl for <linux-snps-arc@lists.infradead.org>; Fri,  7 Jun 2024 08:10:38 GMT
Message-ID: <20240607084500-0.1.3g.1z8j4.0.8qluxbl5ti@quirkbyte.pl>
Date: Fri,  7 Jun 2024 08:10:38 GMT
From: "Norbert Karecki" <norbert.karecki@quirkbyte.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Fotowoltaika - propozycja instalacji
X-Mailer: mail.quirkbyte.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_011438_744311_410EAA44 
X-CRM114-Status: UNSURE (   0.27  )
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

RHppZcWEIGRvYnJ5LAogCkN6eSByb3p3YcW8YWxpIFBhxYRzdHdvIG1vbnRhxbwgc3lzdGVtdSBm
b3Rvd29sdGFpY3puZWdvPwogCkluc3RhbGFjamEgZm90b3dvbHRhaWN6bmEgamVzdCBuYWpsZXBz
enltIHNwb3NvYmVtIG5hIG9ibmnFvGVuaWUgd3lzb2tvxZtjaSByYWNodW5rw7N3IHphIHByxIVk
IChwb3pvc3RhasSFIHR5bGtvIG9wxYJhdHkgc3RhxYJlKSBpIHphYmV6cGllY3plbmllIHNpxJkg
cHJ6ZWQgcm9zbsSFY3ltaSBjZW5hbWkgZW5lcmdpaSBlbGVrdHJ5Y3puZWouIEplc3QgdG8gdyBw
ZcWCbmkgb2RuYXdpYWxuZSBpIGJlemVtaXN5am5lIMW6csOzZMWCbyBlbmVyZ2lpLCBkemnEmWtp
IGN6ZW11IHByenljenluaWFteSBzacSZIGRvIG9jaHJvbnkgxZtyb2Rvd2lza2EgbmF0dXJhbG5l
Z28uCiAKRHppYcWCYW15IG9kIHdpZWx1IGxhdCBuYSByeW5rdSBlbmVyZ2V0eWN6bnltLiBQcnp5
Z290dWplbXkgcHJvamVrdCwgd3ljZW7EmSBvcmF6IGtvbXBsZWtzb3dvIHd5a29uYW15IGkgemfF
gm9zaW15IHJlYWxpemFjasSZIGRvIHpha8WCYWR1IGVuZXJnZXR5Y3puZWdvLiAKIApDenkgY2hj
xIUgUGHFhHN0d28gcG96bmHEhyBuYXN6xIUgcHJvcG96eWNqxJk/ICAKCgpQb3pkcmF3aWFtCk5v
cmJlcnQgS2FyZWNraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zbnBzLWFyYwo=
