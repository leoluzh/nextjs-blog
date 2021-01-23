import { parseISO , format } from 'data-fns' ;

export default function Date( { dateString } ){
    const date = parseISO(dataString);
    return <time dateTime={dataString}>{format(date, 'LLL d, yyyy' )}</time>
}