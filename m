Return-Path: <SRS0=vI3k=CK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADF15C433E6
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 07:41:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B161204EC
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 07:41:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UaAEU7QP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="h7dmGQy1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B161204EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eQthn2I3fBC46NEoFvGOg5yHSRn3KsjWKx6N3IcPRfw=; b=UaAEU7QPLXsO5zVcT/KS8dgxg
	GgP+3lXh996B3XjtbeSice+FCM21yeDkbXaLRRiyDxhwXYEQCAAsZvAosviC4MKHyudwHWLwYVhUo
	saiUuxYKkuuQjJQJvONIj7TnPcQwCA/RLyedbaA0y/opc+vkstPjHhwowJMqQqlC7VkOMMSUfZtk7
	GyryWBs5VxYxmca5VQi2pjQDp/tLeM3y4Z/+PcWlY5mL0MCAiHt32PqXz/hFP/rzx82nOguYFZ6xy
	rwAI3qrHlLshLeboXicmpto6TVH9F1Uob+fslG4oHKB/PQP5UArKYDwaTygu4sKbqZVzAawD6H7EG
	jD+f7s9bw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD0v7-0004QZ-Sv; Tue, 01 Sep 2020 07:41:33 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD0v5-0004PJ-8x; Tue, 01 Sep 2020 07:41:32 +0000
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0817WNaH125544; Tue, 1 Sep 2020 03:40:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=h3419/CEwU26a+0SHFDvKwjc5uwrFx2HmXp4BB3PFtw=;
 b=h7dmGQy1iJCXPBvlTCmpgTw5WSKuIIZR1svzyiP/1aui2jbjQHM9AxTmV/96ZYKAF4HL
 yGYh7Kgyg1ns7FLiu+Wh1/UzwCYT1fq9SJkVWzUg/Fpp0r8FuX3DNQ7/jY+qf9EuXK8S
 YneqVbYvODVnaSuPILEBrP5bQkhfdAS7Cs+nZSg/mqPMYQt75dBBzo6ePeW3BiW1Rw54
 qpEZFSBuFAMjCOCxyfD7UtrM5NZgtSs9JcnnxmGLzUFd7fOkUodwfUFMthRvcddBje0g
 eRkdFMX+MDN4mwVyjs0uwBlWaDt8WuYgQutzVVqR7jKVbFT6FC4AAvtSHw7kSju4VUre 5A== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 339hy60796-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Sep 2020 03:40:28 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0817bLDr016300;
 Tue, 1 Sep 2020 07:40:19 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 337en8b41s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Sep 2020 07:40:19 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0817eH4d12648802
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Sep 2020 07:40:17 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 588AC11C04A;
 Tue,  1 Sep 2020 07:40:17 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 104EC11C04C;
 Tue,  1 Sep 2020 07:40:14 +0000 (GMT)
Received: from [9.85.87.174] (unknown [9.85.87.174])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Sep 2020 07:40:13 +0000 (GMT)
Subject: Re: [PATCH v3 08/13] mm/debug_vm_pgtable/thp: Use page table
 depost/withdraw with THP
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
 <20200827080438.315345-9-aneesh.kumar@linux.ibm.com>
 <e7877a8d-b433-0cb4-50a7-631de0022c24@arm.com>
 <9beaaf93-b2dd-6d56-7737-9f022760f246@linux.ibm.com>
 <d80a91c3-0edf-7e2f-8101-2d37a371f4bd@csgroup.eu>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <2fb4ac88-d417-2bdd-3c56-a816c356636a@linux.ibm.com>
Date: Tue, 1 Sep 2020 13:10:13 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <d80a91c3-0edf-7e2f-8101-2d37a371f4bd@csgroup.eu>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-01_04:2020-09-01,
 2020-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 mlxlogscore=859
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009010060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_034131_451994_7A6D8056 
X-CRM114-Status: GOOD (  20.22  )
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Christophe Leroy <christophe.leroy@c-s.fr>, mpe@ellerman.id.au, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, Qian Cai <cai@lca.pw>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gOS8xLzIwIDEyOjIwIFBNLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+IAo+IAo+IExlIDAx
LzA5LzIwMjAgw6AgMDg6MjUsIEFuZWVzaCBLdW1hciBLLlYgYSDDqWNyaXTCoDoKPj4gT24gOS8x
LzIwIDg6NTIgQU0sIEFuc2h1bWFuIEtoYW5kdWFsIHdyb3RlOgo+Pj4KPj4+Cj4+Pgo+Pj4gVGhl
cmUgaXMgYSBjaGVja3BhdGNoLnBsIHdhcm5pbmcgaGVyZS4KPj4+Cj4+PiBXQVJOSU5HOiBQb3Nz
aWJsZSB1bndyYXBwZWQgY29tbWl0IGRlc2NyaXB0aW9uIChwcmVmZXIgYSBtYXhpbXVtIDc1IAo+
Pj4gY2hhcnMgcGVyIGxpbmUpCj4+PiAjNzoKPj4+IEFyY2hpdGVjdHVyZXMgbGlrZSBwcGM2NCB1
c2UgZGVwb3NpdGVkIHBhZ2UgdGFibGUgd2hpbGUgdXBkYXRpbmcgdGhlIAo+Pj4gaHVnZSBwdGUK
Pj4+Cj4+PiB0b3RhbDogMCBlcnJvcnMsIDEgd2FybmluZ3MsIDQwIGxpbmVzIGNoZWNrZWQKPj4+
Cj4+Cj4+IEkgd2lsbCBpZ25vcmUgYWxsIHRoZXNlLCBiZWNhdXNlIHRoZXkgYXJlIG5vdCByZWFs
bHkgaW1wb3J0YW50IElNSE8uCj4+Cj4gCj4gV2hlbiBkb2luZyBhIGdpdCBsb2cgaW4gYSA4MCBj
aGFycyB0ZXJtaW5hbCB3aW5kb3csIGhhdmluZyB3cmFwcGluZyAKPiBsaW5lcyBpcyBub3QgcmVh
bGx5IGNvbnZlbmllbnQuIEl0IHNob3VsZCBiZSBlYXN5IHRvIGF2b2lkIGl0Lgo+IAoKV2UgaGF2
ZSBiZWVuIGlnbm9yaW5nIHRoYXQgZm9yIGEgbG9uZyB0aW1lICBpc24ndCBpdD8KCkZvciBleGFt
cGxlIHBwYzY0IGNoZWNrcGF0Y2ggYWxyZWFkeSBoYWQKLS1tYXgtbGluZS1sZW5ndGg9OTAKCgpU
aGVyZSB3YXMgYWxzbyByZWNlbnQgZGlzY3Vzc2lvbiB3aGV0aGVyIDgwIGNoYXJhY3RlciBsaW1p
dCBpcyB2YWxpZCBhbnkgCm1vcmUuIEJ1dCBJIGRvIGtlZXAgaXQgcmVzdHJpY3RlZCB0byA4MCBj
aGFyYWN0ZXIgd2hlcmUgZXZlciBpdCBpcyAKZWFzeS9tYWtlIHNlbnNlLgoKLWFuZWVzaAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMt
YXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
