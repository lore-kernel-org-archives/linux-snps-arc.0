Return-Path: <SRS0=i/I/=OS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A01CC433F5
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Sep 2021 09:39:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12E3D610E5
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Sep 2021 09:39:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 12E3D610E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kTfKNyZuR/+O5G3qnfeNhAXRsWEg3cGRBaDPgydZwr0=; b=XZMUlAU+Cs4VbF
	wS/t4+mWEHBqQILBiC0vQkHRJ0WMu5Bs9jL12ocTep/JKow5uBtqD62GFJxEhpKb1S8XtZu3PPzI/
	D9akAzvcru9VB8/U9romAtsG/3CVQ7OAFSrHtV4a++oHM+kNah60Y6stePR8uUUhjVFb/71ysAaQP
	DwUT9DyE8HQ/I5pctKjXhg5AOHpcwvvuW2iQnclDYZSS4uDuFbS0HVws/vBjp1pEMddVTf/B16HkA
	hUwx2SiWVJ34aW/JpgLxrgoVQBFASr2d97xNz9dMb4udNLf71xwOxeojyScJQGhLbjJEN6Mpv+/Nr
	lV27dtDqquggcsxk+YfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV9aE-006e1N-LF; Tue, 28 Sep 2021 09:39:30 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV9a5-006e09-I5; Tue, 28 Sep 2021 09:39:25 +0000
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18S7UBn8026547; 
 Tue, 28 Sep 2021 05:38:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=gd3cWqhTDSyS7Hfr1k1CCLr2jp8k1f/AoKbil7aEFf0=;
 b=duSbsVZmUmqGLbFK1dXmqUDbVDdow4b7xLNuuK5K47qnbpPEyrMtIwAB/evA59updROu
 MX3unQ9lG4a/vui2PNfrpPLwPnSl4BBrTR73aU8ZlzCcijp7K81yQkH44hnzZIclpDT/
 u55G81479MSLWzSJblktfFc0bSNlRF0UW78S6El7BwJ5L0O6casSjyIA7eqj1JvfksCP
 DUBbwr0Q4sQ/CA5nJsWso6zEt2e+CU2V075UOjB4aRuiehirAkx3A4J+8EL9aFuVi6Vw
 UU05Tfj+Gh48Wp+ImIS15K2d10mETT0AdfgmWk6cJUVzMu3jEWNhqZhGzmrMH35Fy/9k 1w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bbxq7afby-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 05:38:37 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18S89K36037942;
 Tue, 28 Sep 2021 05:38:36 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bbxq7afar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 05:38:36 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18S9VruV021585;
 Tue, 28 Sep 2021 09:38:34 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3b9ud9v83y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 09:38:34 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18S9cUB740829210
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Sep 2021 09:38:30 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E61011C05B;
 Tue, 28 Sep 2021 09:38:30 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B07D311C058;
 Tue, 28 Sep 2021 09:38:29 +0000 (GMT)
Received: from osiris (unknown [9.145.163.77])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 28 Sep 2021 09:38:29 +0000 (GMT)
Date: Tue, 28 Sep 2021 11:38:28 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Oscar Salvador <osalvador@suse.de>, Jianyong Wu <Jianyong.Wu@arm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Vineet Gupta <vgupta@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Eric Biederman <ebiederm@xmission.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-snps-arc@lists.infradead.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-mm@kvack.org, kexec@lists.infradead.org
Subject: Re: [PATCH v1 2/4] memblock: allow to specify flags with
 memblock_add_node()
Message-ID: <YVLilCj7C+Aj7T6E@osiris>
References: <20210927150518.8607-1-david@redhat.com>
 <20210927150518.8607-3-david@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210927150518.8607-3-david@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: v4fMMpMPN4hOnztYJTaKk6Fq5kTW6jKy
X-Proofpoint-GUID: WgNggeLkwnBEAxsGbglfAEurxeshA1qK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-28_05,2021-09-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1011 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0
 adultscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=819 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109280056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_023921_651097_14EACB4D 
X-CRM114-Status: GOOD (  19.31  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Mon, Sep 27, 2021 at 05:05:16PM +0200, David Hildenbrand wrote:
> We want to specify flags when hotplugging memory. Let's prepare to pass
> flags to memblock_add_node() by adjusting all existing users.
> 
> Note that when hotplugging memory the system is already up and running
> and we don't want to add the memory first and apply flags later: it
> should happen within one memblock call.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
...
>  arch/s390/kernel/setup.c         | 3 ++-

For s390
Acked-by: Heiko Carstens <hca@linux.ibm.com>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
